class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to user_path(@user), :notice => "Signed Up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
