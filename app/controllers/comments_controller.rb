class CommentsController < ApplicationController
	def index
		@my_concert = Concert.find(params[:concert_id])
		@my_comments = @my_concert.comments
	end
	def create
		@my_concert = Concert.find(params[:concert_id])
		@my_comment = @my_concert.comments.new(
			name: params[:comment][:name],
			comment: params[:comment][:comment],
			concert_id: params[:comment][:concert_id]
			)
		if @my_comment.save
			redirect_to "/concerts/#{@my_concert.id}"
		else
			render "new"
		end
	end
end
