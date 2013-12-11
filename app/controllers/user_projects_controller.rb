class UserProjectsController < ApplicationController

  def index
    @user_proj = UserProject.all
  end

  def new
    @user_proj = UserProject.new
  end

  def create
    newuserproj = UserProject.create(params[:user_project])
    redirect_to user_user_projects_path(current_user)
  end

  def show
    @user_proj = UserProject.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
