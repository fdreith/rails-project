class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def redirect_if_not_authorized(authorized_user)
    if current_user.id != authorized_user
      flash[:warning_message] = "You are not authorized to do that."
      redirect_to root_path
    end
  end
end
