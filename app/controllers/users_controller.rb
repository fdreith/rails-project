class UsersController < ApplicationController

  def update
    current_user.books << Book.find(params[:user][:book_id])
    redirect_to root_path
  end
end
