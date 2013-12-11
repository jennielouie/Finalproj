require 'spec_helper'

describe UsersController do
  describe "POST #create" do
    it "renders the user view page" do
      get :new
      expect(response).to render_template :new
    end
  end
end
