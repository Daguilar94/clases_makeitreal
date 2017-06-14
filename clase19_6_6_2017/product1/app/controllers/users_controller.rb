class UsersController < ApplicationController
  def search
    @user = User
    .includes(:orders)
    .includes(orders: :products)
    .find_by email: params[:email]
    render :'index#holi'
  end
end
