class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      sign_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @created_events = current_user.events
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
