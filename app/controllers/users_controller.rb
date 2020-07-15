class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def new
    @user = User.new
  end

  def create; end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
