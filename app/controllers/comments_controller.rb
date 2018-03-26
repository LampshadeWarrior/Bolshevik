class CommentsController < ApplicationController
before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params.merge(user: current_user, post_id: @post.id))
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :post_id)
  end
end
