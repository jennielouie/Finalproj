class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), :notice => "You've Signed Up Successfully!"
    else
      render "new"
    end
  end

  def show
    @user = current_user
    @user_proj = UserProject.where(user_id: current_user.id)
  end

end
