class ProductsController < ApplicationController
  def table
    @products = Product.all
  end

  def all
  end

  def add
    product = Product.new
    product.name = params[:name]
    product.price = params[:price]
    product.save
    redirect_to table_path
  end
end

#------- Solucion simon --------
#def create
#  product = secure[:product]
#  @product = Product.new product
#  if @product.save
#    redirect_to products_path
#  else
#    render :new
#  end
#end

#def new
#  @product = Product.new
#end
