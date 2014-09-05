class PostsController < ApplicationController

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      flash.now.notice = "<strong>Tweeted!</strong>"
      respond_to do |format|
        format.html { redirect_to new_user_post_path(@user) }
        format.js
      end
    else
      flash.now.alert = "<strong>'Ey!</strong> Check dat again, mon."
      render 'new'
    end
  end

private

  def answer_params
    params.require(:post).permit(:text)
  end
end
