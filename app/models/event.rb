class Event < ActiveRecord::Base
	resourcify
  include Authority::Abilities
	
	belongs_to :user
  belongs_to :category
  has_one :address
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
	has_many :eu_vous, foreign_key: :attended_event_id
	has_many :attendees, through: :eu_vous

	mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :address, allow_destroy: true

	validates_presence_of :category
  
	scope :upcoming, -> { where("Date >= ?", Date.today).order('Date ASC') }
  scope :past, -> { where("Date < ?", Date.today).order('Date DESC') }
	
  def self.search(search)
    if search
      joins("INNER JOIN 'categories' ON 'categories'.id = category_id").where('lower(title) LIKE ? or categories.name LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
    else
      all
    end
  end
  
end

