class ApplicationController < ActionController::Base
  def authenticate_user!
    redirect_to sessions_new_path if current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id
    flash[:success] = 'Successfuly Logged in!'
  end
end
