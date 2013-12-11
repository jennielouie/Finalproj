class ProjectsController < ApplicationController

def index
  @projects = Project.all
end

def new
  @project = Project.new
end

def create
  new_project = Project.create(params[:project])
  redirect_to project_path(new_project)
end

def show
  @project = Project.find(params[:id])
end

end
