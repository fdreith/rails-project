class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  def index 
    @authors = Author.all
    @genre = Genre.all
 
    if !params[:author].blank? && !params[:genre].blank? && !params[:page_count].blank?
      @books = Book.by_author(params[:author]).by_genre(params[:genre]).by_page_count(params[:page_count])
    elsif !params[:author].blank? && !params[:genre].blank? && params[:page_count].blank?
      @books = Book.by_author(params[:author]).by_genre(params[:genre])
    elsif !params[:author].blank? && params[:genre].blank? && !params[:page_count].blank?
      @books = Book.by_author(params[:author]).by_page_count(params[:page_count])
    elsif params[:author].blank? && !params[:genre].blank? && !params[:page_count].blank?
      @books = Book.by_genre(params[:genre]).by_page_count(params[:page_count])
    elsif params[:author].blank? && !params[:genre].blank? && params[:page_count].blank?
      @books = Book.by_genre(params[:genre])
    elsif params[:author].blank? && params[:genre].blank? && !params[:page_count].blank?
       @books = Book.by_page_count(params[:page_count])
    elsif !params[:author].blank? && params[:genre].blank? && params[:page_count].blank?
       @books = Book.by_author(params[:author])
    elsif !params[:title].blank?
      @books = Book.search(params[:title])
    else 
      @books = Book.all
    end

  end

  def new
    @book = Book.new 
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book.author
    else
      render :new
    end
  end

  def show
    @book_club = BookClub.new
    @book_clubs = BookClub.where(book_id: @book.id)
  end

  def edit
  end

  def update
    @book.update(book_params)
    if !@comment.errors.any?
      flash[:notice] = "Book Updated."
      redirect_to @book
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :page_count, genre_attributes: [:name], author_attributes: [:name] )
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
