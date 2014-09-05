class PostsController < ApplicationController

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @tagged_users = []
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      flash.now.notice = "<strong>Tweeted!</strong>"
      respond_to do |format|
        format.html { redirect_to new_user_post_path(@user) }
        format.js
      end
      @post.text.scan(/#\w+/).each {|handle| @tagged_users << User.find_by(handle: handle) }
      @tagged_users.each { |user| UserMailer.tag_confirmation(user, @user).deliver }
    else
      flash.now.alert = "<strong>'Ey!</strong> Check dat again, mon."
      render 'new'
    end
  end

private

  def post_params
    params.require(:post).permit(:text)
  end
end
