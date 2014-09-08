class FollowersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @following = @user.followers.new()
  end

  def create
    @user = User.find(params[:user_id])
    @current_user = current_user
    @following = @user.followers.new(follower_id: @current_user.id)
    if @following.save
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @follower = @user.followers.find_by(follower_id: current_user.id)
    @follower.delete
  end
end
