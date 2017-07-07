class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def create
    safe_params = params.require(:post).permit(:title, :content)
    @post = Post.new safe_params
    @post.user = current_user
    if @post.save
      if current_user.posts.length == 1
        FirstPostMailer.first_post_emaildle(current_customer).deliver_now
      end
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.js { render partial: 'form', content_type: 'text/plain' }
    end
  end

  def edit

  end
  def show
    @post = Post.includes(:comments).find params[:id]
    @comments = @post.comments
    @comment = Comment.new
  end

  def update

  end
  def destroy

  end
end
