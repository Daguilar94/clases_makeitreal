class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  respond_to :js

  def index
    post = Post.find params[:post_id]
    @comments = post.comments
    render json: @comments
  end

  def create
    safe_params = params.require(:comment).permit(:content, :post_id)
    @comment = Comment.new safe_params
    @post = Post.find params[:post_id]
    user = @post.user
    @post.comments.push @comment
    @comment.save
    redirect_to user_post_path(user, @post)
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
    @post = Post.includes(:comments).find params[:post_id]
    Comment.destroy params[:id]
    head :no_content
  end

end
