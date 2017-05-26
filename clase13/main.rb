require 'sinatra'
enable 'sessions'
#ruby 'main.rb' -p 3000
products = [
  {name: 'audifonos',price: 5000, currency: 'usd'},
  {name: 'carro',price: 4000, currency: 'usd'},
  {name: 'libro',price: 50, currency: 'usd'},
  {name: 'tenis',price: 99, currency: 'usd'}
]

get '/' do
  @products = products
  @email = request.cookies['email']
  erb :index
end

get '/products/new' do
@email = request.cookies['email']
erb :products_new
end

post '/products/new' do
  name = params[:name]
  price = params[:price]
  currency = params[:currency]
  products.push({
    name: name,
    price: price,
    currency: currency
    })
    redirect '/'
end

delete '/products/:name' do
  product = products.find do |product|
    product[:name]== params[:name]
  end
  return redirect '/' unless product
  products.delete product
  redirect '/'
end

#curl localhost:3000/products/Celular -x DELETE
#curl localhost:3000/products/tenis -X DELETE

#COOKIES

get '/visited' do
  @email = request.cookies['email']
  @visited = request.cookies.fetch('visited',0).to_i
  response.set_cookie 'visited', @visited + 1
  erb :visited
end

get '/login' do
  @email = request.cookies['email']
  erb :login
end

post '/login' do
  if params[:email] == 'David@gmail.com' && params[:password] == '1234'
    @email = request.cookies['email']
    response.set_cookie 'email', params[:email]
  end
  redirect '/'
end

get '/salir'do # EXPERIMENTO
  response.delete_cookie 'email'
  redirect '/'
end

get '/products/:name' do
  name = params[:name]
  @product = products.find{|product| product[:name] == name}
  halt 404, 'product not found' unless @product
  erb :product
end

post '/cart' do
  product = params[:product]
  cart = session[:cart]
  if cart
    cart << product
  else
    cart = [product]
    session[:cart] = cart
  end
  redirect '/'
end
