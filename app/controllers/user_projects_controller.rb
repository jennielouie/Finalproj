require 'pry'
class UserProjectsController < ApplicationController

  def index
    @user_proj_list = current_user.projects
  end

  def new
    @user_proj = UserProject.new
    @project = Project.all
    gon.user_proj = @user_proj.attributes
    # respond_to do |format|
    #   format.html
    #   format.json {render :json => @project}
    # end
  end

  def create
    @user_proj = UserProject.create(params[:user_project])
    redirect_to user_user_projects_path(current_user.id)
  end

  def show
    @user_proj = current_user.user_projects.find(params[:id])
    gon.user_proj = @user_proj.attributes
    @project = current_user.projects.find(@user_proj.project_id)
    @instructions = Instruction.find_all_by_project_id(params[:id])
      respond_to do |format|
      format.html
      format.json { render :json => @instructions }
      end
  end

  def edit
    @user_proj = current_user.user_projects.find(params[:id])
      respond_to do |format|
      format.html
      format.json { render :json => @user_proj }
      end
  end

  def update

    @user_proj = current_user.user_projects.find(params[:id])
    @user_proj.update_attributes(params[:user_project])
    render :nothing => true
  end

  def destroy
    current_user.user_projects.delete(params[:id])
    redirect_to user_user_projects_path(current_user)
  end

end
