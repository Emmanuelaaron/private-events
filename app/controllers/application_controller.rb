# rubocop: disable  Lint/UselessAssignment: Useless assignment to variable
class ApplicationController < ActionController::Base
  def current_user
    current_user ||= User.find(session[:user_id])
  end

  def authenticate_user!
    !current_user.nil?
  end
end

# rubocop: enable  Lint/UselessAssignment: Useless assignment to variable
