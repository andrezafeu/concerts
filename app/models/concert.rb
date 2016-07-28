class Concert < ActiveRecord::Base
	has_many :comments
	validates_presence_of :artist, :venue, :city, :date, :price
end
