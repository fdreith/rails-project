class UsersController < ApplicationController

  def update
    current_user.books << Book.find(params[:user][:book_id])
    flash[:notice] = "Book added to your read list."
    redirect_to root_path
  end
end
