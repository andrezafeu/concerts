class SiteController < ApplicationController
	def home
		@concerts = Concert.order(date: :asc).limit(10)
	end
end
