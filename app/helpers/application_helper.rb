module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to sessions_new_path if current_user.nil?
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    session[:user_id] = user.id
    flash[:success] = 'Successfuly Logged in!'
  end
end
