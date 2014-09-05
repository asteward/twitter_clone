class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "<strong>Hey, #{user.username}!</strong> Check out our cool new posts!".html_safe
      redirect_to posts_path
    else
      flash.now.alert = "<strong>Hey, now -</strong> Check that username and password again.".html_safe
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end
end
