class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to sessions_new_path if current_user.nil?
  end
end
