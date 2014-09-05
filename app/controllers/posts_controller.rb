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
end


@user = current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash.now.notice = "Successfully saved answer"
      respond_to do |format|
        format.html { redirect_to new_question_answer_path(@question) }
        format.js
      end
    else
      flash.now.alert = "Incomplete!!!!!!!!!!"
      render 'new'
    end
