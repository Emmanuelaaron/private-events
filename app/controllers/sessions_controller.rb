class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params['user']['username'])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:alert] = 'You are not signed up yet!'
      render 'new'
    end
  end

  def destroy; end
end
