class BoardsController < ApplicationController
	def index 
		@boards = Board.all
	end

	def new
		@board = Board.new
	end

	def create
		@board = Board.new(params_board)
		if @board.save
			redirect_to boards_path
		else
			render new_board_path
		end 
	end

	def show
		@board = Board.includes(:comments).find(params[:id])
		@comment = Comment.new
	end

	def edit
		@board = Board.find(params[:id])
	end

	def update
		@board = Board.find(params[:id])
		if @board.update_attributes(params_board)
			redirect_to "/boards/#{@board.id}"
		else
			redirect_to "/boards/#{@board.id}/edit"
		end
	end
	
	def destroy
		@board = Board.find(params[:id])
		@board.destroy
		redirect_to "/boards"
	end

	private

	def params_board
		params.require(:board).permit(:title, :editor)
	end

end
