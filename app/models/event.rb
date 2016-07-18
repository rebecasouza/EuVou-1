class Event < ApplicationRecord
  belongs_to :user
  
  belongs_to :category
  has_many :comments, as: :commentable
  has_one :address
  has_many :euvous
  has_many :users, through: :euvous
end
