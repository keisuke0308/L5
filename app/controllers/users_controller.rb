class UsersController < ApplicationController
  require "bcrypt"
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(uid: params[:uid], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      redirect_to users_path
    else
      render new_user_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
  
end
