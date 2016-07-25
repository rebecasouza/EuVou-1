class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :admin, :profile_image, :tumbnail
  has_many :events
  has_many :comments
  #has_many :notifications

  def profile_image
	  object.image_url(:user_profile)  	
  end

  def thumbnail
  	object.image_url(:user_thumb)
  end

end
