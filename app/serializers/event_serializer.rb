class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :time, :image
  has_one :user
end
