Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index', to: 'index#index'
  root 'index#index'



  get 'holi/crear'

  get 'holi/actualizar'

  get 'holi/ver(/:nombre)', to: 'holi#ver' #El (/:nombre) es para que sea opcional el link, si no ponen nombre tambien funciona enviando un nil

  get 'holi/products' => 'holi#products', as: 'products1' #Convierte el nombre de la ruta a solo products

##### EJERCICIO PONER LOS ELEMENTOS  DE LA LISTA COMO LINKS

  #get 'products' , to: 'lista#list' ## Se puede hacer de las dos maneras
  get 'products'=> 'list#list_products'

  get 'products/:nombre'=> 'list#product', as: 'item'

  #get 'products/manzanas', to: 'list#manzanas', as: 'manzanas'
  #get 'products/limones', to: 'list#limones', as: 'limones'
  #get 'products/duraznos', to: 'list#duraznos', as: 'duraznos'
  #get 'products/peras', to: 'list#peras', as: 'peras'
end
