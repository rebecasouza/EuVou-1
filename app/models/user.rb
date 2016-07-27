class User < ApplicationRecord
	has_secure_password
	
	has_many :events
	has_many :comments
	has_many :euvous
	#has_many :notifications, as: :recipient

	mount_uploader :image, ImageUploader

	validates :email, presence: true, uniqueness: true

end
