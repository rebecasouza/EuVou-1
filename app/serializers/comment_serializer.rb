class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :commentable_id, :commentable_type
  belongs_to :user
  belongs_to :event
end
