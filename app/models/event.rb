class Event < ApplicationRecord
	has_many :comments
	has_many :reports
	has_many :attends
	has_one :address
end
