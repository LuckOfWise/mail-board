class CommentsController < ApplicationController
  before_action :set_board

  def create
    @comment = @board.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      UserMailer.comment_created(@comment).deliver! unless @comment.user == @comment.board.user
      redirect_to @board, notice: 'コメントしました。'
    else
      render 'boards/show'
    end
  end

  def destroy
    comment = @board.comments.find_by(user_id: current_user.id, id: params[:id])
    comment.destroy!
    redirect_to @board, notice: 'コメントを削除しました。'
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def comment_params
    params.fetch(:comment, {}).permit(:content)
  end

end
