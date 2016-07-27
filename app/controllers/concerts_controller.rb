class ConcertsController < ApplicationController
	def new
		@my_concert = Concert.new
	end
	def create
		@my_concert = Concert.new(
			:artist => params[:concert][:artist],
			:venue => params[:concert][:venue],
			:city => params[:concert][:city],
			:date => params[:concert][:date],
			:price => params[:concert][:price],
			:description => params[:concert][:description]
			)
		@my_concert.save
		redirect_to "/concerts/#{@my_concert.id}"
	end
end
