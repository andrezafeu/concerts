class Concert < ActiveRecord::Base
	validates_presence_of :artist, :venue, :city, :date, :price
end
