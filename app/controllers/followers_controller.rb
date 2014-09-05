class FollowersController < ApplicationController
  def new
    @follower = @user.followers.new()
  end

end
