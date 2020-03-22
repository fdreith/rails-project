class BookClubsController < ApplicationController
  before_action :set_book_club, only: [:show, :update, :destroy]
  
  def index
    @book_clubs = BookClub.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @book_club = BookClub.new
  end

  def create 
    @book = Book.find(params[:book_club][:book_id])   
    @book_club = current_user.owned_clubs.create(book_club_params)
    if @book_club.persisted?
      @book_club.users << current_user
      redirect_to @book_club
    else
      render "books/show"
    end
  end

  def update
    if params[:commit] == "Join"
      @book_club.users << current_user
      redirect_to @book_club
    else 
      @book_club.user_book_clubs.each do |user_club|
        if user_club.user_id == current_user.id
          user_club.destroy
          flash[:notice] = "You've Left #{@book_club.name}"
        end
      end
      redirect_to root_path
    end
  end

  def destroy
    @book_club.destroy 
    flash[:notice] = "You've Deleted #{@book_club.name}"
    redirect_to root_path
  end

  private

  def book_club_params
    params.require(:book_club).permit(:name, :book_id)
  end

  def set_book_club
    @book_club = BookClub.find(params[:id])
  end

end
