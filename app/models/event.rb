class Event < ActiveRecord::Base
	resourcify
  include Authority::Abilities
	
	belongs_to :user
  belongs_to :category
	
	mount_uploader :images, ImageUploader


	validates_presence_of :category

end

