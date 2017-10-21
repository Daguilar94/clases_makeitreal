module Api
  module V1
    class UsersController < ApplicationController
      def create
        params_safe = params.require(:user).permit(:username, :full_name)
        user = User.new params_safe
        if user.save
          render json: user
        else
          render json: { errors: user.errors }, status: 422
        end
      end

      def show
        user = User.includes(:articles).find params[:id]
        render json: { user: user, articles: user.articles}
      end
    end
  end
end
