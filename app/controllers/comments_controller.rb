class CommentsController < ApplicationController

	def create
		@board = Board.find(params[:board_id])
		@comment = Comment.new(params_comment)
		@comment.board = @board

		if @comment.save
			redirect_to board_path(@board)
		else
			redirect_to board_path(@board)
		end
	end

	def destroy
		@board = Board.find(params[:board_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to board_path(@board)
	end



	private

	def params_comment
		params.require(:comment).permit(:name,:content)
	end

end 