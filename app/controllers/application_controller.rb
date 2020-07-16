class ApplicationController < ActionController::Base
  def current_user
    if !current_user.nil?
      current_user
    elsif !session.nil? && User.find(session[:user_id])
      User.find(session[:user_id])
    else
      redirect_to new_user_path
    end
  end

  def authenticate_user!
    !current_user.nil?
  end
end
