class Event < ApplicationRecord
	has_many :comments
	
	has_many :attends, foreign_key: :attended_event_id
  has_many :attendees, through: :attends
  
  has_many :reports, foreign_key: :reported_event_id
	has_many :reportees, through: :reports
end
