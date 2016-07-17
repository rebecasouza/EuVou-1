class Attend < ApplicationRecord
	belongs_to :attended_event, class_name: 'Event'
end
