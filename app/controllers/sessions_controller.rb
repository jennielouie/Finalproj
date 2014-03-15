class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_user_projects_path(current_user)
    else
      flash.alert = "Invalid email or password. Please retry."
      render "new"
    end
  end

  def destroy
    if current_user
      session[:user_id] = nil
      flash.alert = "You're now logged out."
    end
    redirect_to root_url
  end
end
