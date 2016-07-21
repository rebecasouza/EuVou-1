class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :admin
  has_many :events
  has_many :comments
  #has_many :notifications
end
