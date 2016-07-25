class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :admin, :image
  has_many :events
  has_many :comments
end
