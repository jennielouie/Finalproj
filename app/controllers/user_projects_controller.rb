class UserProjectsController < ApplicationController

  def index
    @user_proj = UserProject.all
  end

  def new
    @user_proj = UserProject.new
  end

  def create
    newuserproj = UserProject.create(params[:user_project])
    redirect_to user_path(current_user)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
