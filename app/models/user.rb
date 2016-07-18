class User < ApplicationRecord
	has_many :comments, as :commentable
	has_many :events
end
