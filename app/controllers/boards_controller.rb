class BoardsController < ApplicationController

  def index
    @boards = Board.order(created_at: :desc)
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to @board, notice: '登録しました。'
    else
      render :new
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to boards_url, notice: '削除しました。'
  end

  private

  def board_params
    params.require(:board).permit(:title, :content)
  end

end
