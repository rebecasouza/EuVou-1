class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :time, :thumbnail, :euvous_count
  belongs_to :user
  belongs_to :category
  has_one :address
  has_many :comments

  def euvous_count
  	object.euvous.count
  end

  def thumbnail
  	object.image_url(:event)
  end
end
