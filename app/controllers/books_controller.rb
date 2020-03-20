class BooksController < ApplicationController

  def index 
    @books = Book.all
  end

  def new
    @book = Book.new 
    if params[:author_id]
      @author = Author.find(params[:author_id])
    end
  end

  def create
    @book = Book.create(book_params)
    if @book.persisted?
      redirect_to @book.author
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_club = BookClub.new
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :page_count, genre_attributes: [:name], author_attributes: [:name] )
  end

end
