class Address < ActiveRecord::Base
  belongs_to :event
	
	#validates :street, :number, :district, :city, presence: true
end
