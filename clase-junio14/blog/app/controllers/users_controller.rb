class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def edit
  end
  def show
  end
  def update
  end
  def posts
    #current_user
    @posts = User.includes(:posts).find(current_user.id).posts
  end
  def destroy
  end
end
