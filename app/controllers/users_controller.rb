class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserMailer.signup_confirmation(@user).deliver
      flash[:notice] = "Thanks for signing up, <strong>#{@user.username}!</strong>".html_safe
      redirect_to user_path(@user)
    else
      flash[:alert] = "<strong>Whoa!</strong> Let's take another look...".html_safe
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :handle, :email)
  end
end
