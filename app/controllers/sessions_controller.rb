class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params['user']['username'])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = 'Invalid user name!'
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end
end
