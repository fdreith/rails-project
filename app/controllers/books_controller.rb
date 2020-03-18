class BooksController < ApplicationController

  def index 
  end

  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
  end

  def show
  end

end
