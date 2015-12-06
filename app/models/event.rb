class Event < ActiveRecord::Base
	resourcify
  include Authority::Abilities
	
	belongs_to :user
	
	has_one :address, dependent: :destroy
	accepts_nested_attributes_for :address #, regect_if: proc {|attributes| attributes["street"].blank?}
	
	mount_uploaders :images, ImageUploader

end

