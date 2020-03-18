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
    binding.pry
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
    @book = Book.find(params[:id])
  end

  def have_read #should this method be in a user_controller?
    @book = Book.find(params[:book_id])
    current_user.books << @book
  end

end
