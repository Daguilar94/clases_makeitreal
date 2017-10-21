module Api
  module V1
    class ArticlesController < ApplicationController
      def create
        safe_params = params.require(:article).permit(:title, :content)
        article = Article.new safe_params
        article.user_id = params[:user_id]
        if article.save
          render json: article
        else
          render json: { errors: article.errors }, status: 422
        end
      end
    end
  end
end
