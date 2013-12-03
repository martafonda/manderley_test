class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render action: 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:admin, :email)
  end
end