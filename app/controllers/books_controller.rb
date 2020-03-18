class BooksController < ApplicationController

  def index 
    @books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
  end

  def create
    author = Author.find_or_create_by(name: params[:book][:author])
    genre = Genre.find_or_create_by(name: params[:book][:genre])

    book = Book.create(
      title: params[:book][:title],
      author_id: author.id,
      genre_id: genre.id,
      page_count: params[:book][:page_count]
    )
    if book 
      redirect_to books_path
    else
      render :new
    end


  end

  def show
  end

end
