class UserProjectsController < ApplicationController

  def index
    @user_proj_list = current_user.projects
  end

  def new
    @user_proj = UserProject.new
    @project = Project.all
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
    @project = current_user.projects.find(@user_proj.project_id)
    gon.user_proj = @user_proj.attributes
    @instructions = Instruction.find_all_by_project_id(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @instructions }
    end
  end

  def edit
    @user_proj = current_user.user_projects.find(params[:id])
  end

  def update
    @user_proj = current_user.user_projects.find(params[:id])
    @user_proj.update.attributes(params[:user_project])
    redirect_to user_user_project_path(current_user, @user_proj)
  end

  def destroy
    current_user.user_projects.delete(params[:id])
    redirect_to user_user_projects_path(current_user)
  end

end
