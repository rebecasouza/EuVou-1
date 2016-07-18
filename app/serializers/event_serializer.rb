class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :time, :image
  belongs_to :user
  belongs_to :category
  has_one :address
  has_many :comments
end
