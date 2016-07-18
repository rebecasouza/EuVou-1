class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable
end
