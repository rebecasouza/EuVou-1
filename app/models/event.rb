class Event < ActiveRecord::Base
	resourcify
  include Authority::Abilities
	
	belongs_to :user
	
	has_one :address
	accepts_nested_attributes_for :address, #regect_if: proc {|attributes| attributes["list of attributes needed for address"].blank?}
	
	mount_uploaders :images, ImageUploader

end

