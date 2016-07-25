class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :time, :euvous_count, :image
  belongs_to :user
  belongs_to :category
  has_one :address
  has_many :comments
  has_many :euvous
  has_many :users, through: :euvous

  def euvous_count
    object.euvous.count
  end
end
