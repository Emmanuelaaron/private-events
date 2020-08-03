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

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d="
  end

  def error_flashes
    if flash[:danger]
      content_tag(:p, flash[:danger],
                  class: 'alert alert-danger my-3 p-3')
    elsif flash[:success]
      content_tag(:p, flash[:success],
                  class: 'alert alert-success my-3 p-3')
    end
  end

  def logged_in_private?
    if signed_in?
      link_to current_user.username.capitalize,
              current_user, class: 'navbar-brand'
    else
      content_tag(:p, '<%= PrivateEvents %>',
                  class: 'avbar-brand')
    end
  end
end
