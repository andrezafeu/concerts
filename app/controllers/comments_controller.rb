class CommentsController < ApplicationController
	def index
		@my_concert = Concert.find(params[:concert_id])
		@my_comments = @my_concert.comments
	end
	def create
		@my_concert = Concert.find(params[:concert_id])
		@my_comment = @my_concert.comments.new(comment_params)
		if @my_comment.save
			redirect_to concert_path(@my_concert)
		else
			render "new"
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:name, :comment)
	end
end
