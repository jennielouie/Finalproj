require 'spec_helper'

describe ProjectsController do
  describe "GET index" do
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "should assign @projects" do
      project = Project.create(projtitle: 'Shorts')
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #new" do
    it "renders the new project view" do
      get :new
      expect(response).to render_template :new
    end
  end
end
