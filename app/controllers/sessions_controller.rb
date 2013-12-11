class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_userprojects_path(user)
    else
      flash.alert = "Invalid email or password. Please retry."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash.alert = "You're now logged out."
    redirect_to root_url
  end
end
