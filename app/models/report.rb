class Report < ApplicationRecord
	belongs_to :reported_event, class_name: 'Event'
end
