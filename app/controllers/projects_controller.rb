class ProjectsController < ApplicationController

def index
  @projects = Project.all
end

def new
  @project = Project.new
  @user_project = UserProject.new
end

def create
  new_project = Project.create(params[:project])
  new_project.parsePattern
  redirect_to project_path(new_project)
end

def show
  @project = current_user.projects.find(params[:id])
  @instructions = Instruction.find_all_by_project_id(params[:id])
  respond_to do |format|
    format.html
    format.json { render :json => @instructions }
  end
end

end
