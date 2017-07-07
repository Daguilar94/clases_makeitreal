class CommentsController < ApplicationController

  def index
  end

  def create
    safe_params = params.require(:comment).permit(:content, :post_id)
    @comment = Comment.new safe_params
    @post = Post.find params[:post_id]
    @post.comments.push @comment
    @comment.save
    redirect_to user_post_path(current_user, @post)
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
