class Event < ActiveRecord::Base
	resourcify
  include Authority::Abilities
	
	belongs_to :user
	
	mount_uploader :images, ImageUploader

end

