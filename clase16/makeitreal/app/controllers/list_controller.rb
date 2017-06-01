class ListController < ApplicationController
  def list_products
    @lista=lista_productos
  end
  def lista_productos
    [{name: 'manzanas'},{name: 'limones'}, {name: 'duraznos'}, {name: 'peras'}]
  end
  def product
    @lista=lista_productos
    @seleccion = @lista.find do |producto|
      producto == params[:nombre]
    end
  end
end
