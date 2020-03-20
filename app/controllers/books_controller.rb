class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

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
    @book_club = BookClub.new
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :page_count, genre_attributes: [:name], author_attributes: [:name] )
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
