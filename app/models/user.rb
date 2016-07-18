class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :identities, dependent: :destroy

  has_many :events
	has_many :comments
	has_many :eu_vous, foreign_key: :attendee_id
	has_many :attended_events, through: :eu_vous
  
  after_create :set_default_role, if: Proc.new { User.count > 1 }
  mount_uploader :image, ImageUploader

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  validates_presence_of :name
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update


  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
					name: auth.info.name || auth.extra.nickname ||  auth.uid,
					email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
					password: Devise.friendly_token[0,20],
					image: auth.info.image
        )
        user.skip_confirmation!
        user.save!
      end
    end
		
		def largeimage
			"http://graph.facebook.com/#{self.uid}/picture?type=large"
		end
	 
		def normalimage
			"http://graph.facebook.com/#{self.uid}/picture?type=normal"
		end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
	
	# Event methods
	
  def upcoming_events
    self.attended_events.upcoming
  end

  def previous_events
    self.attended_events.past
  end

  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
		self.eu_vous.create!(attended_event_id: event.id)
  end

  def cancel!(event)
		self.eu_vous.find_by(attended_event_id: event.id).destroy
  end
	
  private

  def set_default_role
    add_role :user
  end

end