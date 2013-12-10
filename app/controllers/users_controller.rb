class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    new_user = User.create(params[:user])
    redirect_to user_path(new_user)
  end

  def show
    @user = User.find(params[:id])
  end

end
