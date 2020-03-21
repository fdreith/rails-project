class CommentsController < ApplicationController

  def edit
    @book_club = BookClub.find(params[:book_club_id])
    @comment = Comment.find(params[:id])
  end

  def update
    binding.pry
    @book_club = BookClub.find(params[:comment][:book_club_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if !@comment.errors.any?
      redirect_to book_club_path(@book_club.id)
    else
      render :edit
    end
  end

  def create
    @comment = Comment.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :book_club_id, :user_id)
  end
end
