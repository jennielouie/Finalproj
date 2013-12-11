class UserProjectsController < ApplicationController

  def index
    @userprojs = UserProject.all
  end

  def new
    @userproj = UserProject.new
  end

  def create
    @userproj = UserProject.create(params[:user_project])
    redirect_to projects_path
  end

  def show
    @userproj = UserProject.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
