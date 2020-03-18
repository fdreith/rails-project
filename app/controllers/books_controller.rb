class BooksController < ApplicationController

  def index 
    @books = Book.all
  end

  def new
    @book = Book.new

  end

  def create
    if !params[:book][:author_id].empty?
      author = Author.find(params[:book][:author_id])
    else 
      author = Author.create(name: params[:book][:author_attributes][:name])
    end
     
    if !params[:book][:genre_id].empty?
      genre = Genre.find(params[:book][:genre_id])
    else
      genre = Genre.create(name: params[:book][:genre_attributes][:name])
    end

    @book = Book.create(
      title: params[:book][:title].strip,
      author_id: author.id,
      genre_id: genre.id,
      page_count: params[:book][:page_count]
    )
    if @book.persisted?
      redirect_to books_path
    else
      render :new
    end

  end

  def show
    @book = Book.find(params[:id])
  end




end
