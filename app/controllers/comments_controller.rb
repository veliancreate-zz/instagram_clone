class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(options = { text: comments_params[:text], user: current_user })

    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to '/posts'
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
