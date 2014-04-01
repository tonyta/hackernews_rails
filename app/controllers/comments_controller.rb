class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments
  end

  def show
    @comment = Comment.find(params[:id])

  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to @post, notice: 'your comment was added below'
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end
end
