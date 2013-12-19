class UserProjectsController < ApplicationController

  def index
    @proj_list = current_user.projects
  end

# gon used to pass current user info
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
    @instructions = Instruction.find_all_by_project_id(@user_proj.project_id)
      respond_to do |format|
      format.html
      format.json {render :json => @instructions} #javascript changeInstruction function uses this json to get project instructions
      end
  end

  def edit
    @user_proj = current_user.user_projects.find(params[:id])
      # respond_to do |format|
      # format.html
      # format.json {render :json => @user_proj} #
      # end
  end

  def update
    @user_proj = current_user.user_projects.find(params[:id])
    @user_proj.update_attributes(params[:user_project])
    render :nothing => true #because request sent via ajax, this prevents redirecting to the "show" page
  end

  def destroy
    current_user.user_projects.destroy(params[:id])
    redirect_to user_user_projects_path(current_user)
  end

end
