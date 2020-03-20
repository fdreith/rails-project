class BookClubsController < ApplicationController
  
  def index
    @book_clubs = BookClub.all
  end

  def show
    @comment = Comment.new
    @book_club = BookClub.find(params[:id])
  end

  def new
    @book_club = BookClub.new
  end

  def create 
    @book = Book.find(params[:book_club][:book_id])   
    @book_club = BookClub.create(book_club_params)
    if @book_club.persisted?
      @book_club.users << current_user
      redirect_to @book_club
    else
      render :new
    end
  end

  def destroy
    BookClub.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def book_club_params
    params.require(:book_club).permit(:name, :passcode, :book_id, :owner_id => current_user.id)
  end

end
