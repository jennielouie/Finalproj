class UserProjectsController < ApplicationController

  def index
    @user_proj_list = User.find(current_user.id).projects
  end

  def new
    @user_proj = UserProject.new
    @project = Project.all
  end

  def create
    @user_project = UserProject.create(params[:user_project])
    redirect_to user_path(current_user)
  end

  def show
    @user_proj = UserProject.find(params[:id])
    @project = Project.find(@user_proj.project_id)
    @instructions= Instruction.find_all_by_project_id(@user_proj.project_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
