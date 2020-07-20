class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params['user']['username'])
    if user
      sign_in(user)
      redirect_to user_path(user)
    else
      flash[:danger] = 'Invalid user name!'
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You are successful logged out!'
    redirect_to sessions_new_path
  end

  def sign_in(user)
    session[:user_id] = user.id
    flash[:success] = 'Successfuly Logged in!'
  end
end
