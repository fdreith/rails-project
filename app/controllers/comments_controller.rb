class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update]
  before_action :set_book_club_comment, only: [:create, :update]
  before_action :set_book_club, only: [:edit, :destroy]

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to book_club_path(@book_club)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    if !@comment.errors.any?
      redirect_to book_club_path(@book_club)
    else
      render :edit
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to book_club_path(@book_club)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :book_club_id, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_book_club_comment
    @book_club = BookClub.find(params[:comment][:book_club_id])
  end

  def set_book_club
    @book_club = BookClub.find(params[:book_club_id])
  end

end
