class PostsController < ApplicationController

  def new
    @user = current_user
    @post = @user.posts.new
  end
  
end
