class ConcertsController < ApplicationController
	def new
		@my_concert = Concert.new
	end
	def create
		@my_concert = Concert.new(concert_params)
		if @my_concert.save
			redirect_to concert_path(@my_concert)
		else
			render "new"
		end
	end
	def show
		@my_concert = Concert.find_by(id:params[:id])
		@comments = @my_concert.comments.order(created_at: :desc)
		@my_comment = @my_concert.comments.new
		unless @my_concert
			render "no_concerts_found"
		end
	end
	def popular
		@concerts = Concert.all
 		@concerts = @concerts.sort_by do |concert|
 			concert.comments.count
 		end
 		@concerts = @concerts.last(10).reverse
	end

	private
	def concert_params
		params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
	end
end
