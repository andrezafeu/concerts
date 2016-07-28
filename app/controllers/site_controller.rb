class SiteController < ApplicationController
	def home
		@concerts = Concert.order(date: :asc).limit(10)
	end
	def search
		@my_price = params[:cost]
		@concerts = Concert.where("price < ?", @my_price)
		render "site/search"
	end
end
