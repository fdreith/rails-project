class UsersController < ApplicationController

  def edit
    binding.pry
    @user = current_user
  end

  def update
    binding.pry
  end
end
