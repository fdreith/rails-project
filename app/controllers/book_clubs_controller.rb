class BookClubsController < ApplicationController

  def index
    @book_clubs = BookClub.all
  end

  def create 
    @book = Book.find(params[:book_club][:book_id])   
    @book_club = BookClub.create(
      name: params[:book_club][:name],
      passcode: params[:book_club][:passcode],
      book_id:params[:book_club][:book_id], 
      owner_id: current_user.id 
      )
    if @book_club.persisted?
      @book_club.users << current_user
      redirect_to book_club_path(@book_club)
    else
      render book_path(@book)
    end
  end

end
