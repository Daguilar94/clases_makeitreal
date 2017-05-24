require 'sinatra'

get '/' do
  puts "PARAMS = #{params}"
  @nombre = params[:name]
  erb :index
end

get '/holamundo' do
  puts params
  'hola mundo'
end

get '/orders' do
  #puts "#{params[:search]}" #Asi se puede coger el contedido de los formularios web
  @orders = [
    {order_id: 'o_ifjnlifb', price: 5000},
    {order_id: 'o_ifjnrfds', price: 5000},
    {order_id: 'o_ifjnlfgh', price: 5000},
    {order_id: 'o_ifqwesxx', price: 5000},
  ]

  @order = @orders.find { |order|
  order[:order_id] == params[:order_id]
  }
  erb :orders
end

get '/orders/:order_id' do
  puts "ORDER ID=#{params[:order_id]}"
  puts "SORT BY=#{params[:sort]}"
end

get '/customers/:email/orders' do
  puts "ORDER ID=#{params[:email]}"
end

get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]
  puts "EMAIL = #{params[:email]}"
  puts "PASSWORD = #{params[:password]}"
  if email.empty? || password.empty?
    @errors = [{message: "Sorry, email and password can't be empty"}]
    return error 400, erb(:login)
  end
  unless email == 'david@gmail.com' && password == '1234'
    @errors = [{message: "Email and password doesn't match"}]
    return error 400, erb(:login)
  end
    redirect "/user_account/#{params[:email]}"
end

get '/user_account/:email' do
  @email = params[:email]
  erb :account
end
