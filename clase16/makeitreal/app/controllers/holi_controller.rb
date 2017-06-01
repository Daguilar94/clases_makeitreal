class HoliController < ApplicationController
  def crear
  end

  def actualizar
  end

  def ver
    @nombre = params[:nombre]
    render layout: "custom_product"
  end

  def products
    @products =[
      {name: 'Audifonos', precio: 49999},
      {name: 'Reloj', precio: 94984}
    ]
    render json: @products, status: :not_found
  end

end
