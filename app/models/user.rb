class User < ActiveRecord::Base
  rolify
	
	include Authority::UserAbilities
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :identities, dependent: :destroy
	after_create :set_default_role, if: Proc.new { User.count > 1 }
	
	
	
	def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  private

  def set_default_role
    add_role :user
  end
	
end
