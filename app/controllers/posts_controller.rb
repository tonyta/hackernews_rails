class PostsController < ApplicationController
  def index
    if @user = User.find_by_id(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
