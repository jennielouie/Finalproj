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
    @user_proj = UserProject.find(params[:id])
  end

  def update
    @user_proj = UserProject.find(params[:id])
    @user_project.update.attributes(params[:user_project])
    redirect_to user_user_project_path(current_user, @user_proj)
  end

  def destroy
    UserProject.delete(params[:id])
    redirect_to user_user_projects_path(current_user)
  end

end
