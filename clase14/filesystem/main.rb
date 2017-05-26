require 'sinatra'
require 'sinatra/reloader' if development? #Esto es una gema que instalè para que no haya que reiniciar el servidor cada vez que haya un cambio
enable :sessions

signed_up = [
{email: 'santiago@gmail.com', password: '1', permission: 'admin'},
{email: 'mateo@gmail.com', password: '2', permission: 'user'},
{email: 'jaime@gmail.com', password: '3', permission: 'user'},
{email: 'david@gmail.com', password: '4', permission: 'admin'},
]

get '/' do
  @vence = request.cookies['vence']
  redirect '/stand_by' if @vence != nil
  #session[:tries] = 0 ********************** Why isn't it needed??
  erb :index
end

post '/login' do
  @vence = request.cookies['vence']
  redirect '/stand_by' if @vence != nil

  email = params.fetch('email','').strip
  password = params.fetch('password','').strip

  if email.empty? || password.empty?
    @errors = [{message: "Sorry, email and password can't be empty"}]
    return error 400, erb(:index)
  end

  signed_up.each do |person|
    if person[:email] == email && person[:password] == password
      @current_email = person[:email]
      @current_password = person[:password]
      @current_permission = person[:permission]
    end
  end

  unless @current_email != nil && @current_password != nil
    @errors = [{message: "Email and password doesn't match"}]
    #--------------
    session[:tries] += 1
    if  session[:tries] >= 3
    @vence = request.cookies.fetch('vence',0).to_i
    response.set_cookie(:vence, :value => 1, :expires => Time.now + 60)
    session[:tries] = 0
    return redirect '/stand_by'
    end
    #--------------
    return error 400, erb(:index)
  end
  session[:current_customer] = {email: @current_email, permission: @current_permission}
  puts session[:current_customer]
  redirect '/files'
end

post '/logout' do
  session.clear
  redirect '/'
end

get '/files' do
  unless session[:current_customer]
    return redirect '/'
  end

  entries = Dir.entries '.'#dir.entries Para listar los archivos en el directorio actual o el antarior etc
  @directories = entries.select {|entry| File.directory? entry}
  @files = entries.select {|entry| File.file? entry}
  @customer = session[:current_customer]
  erb :files
end

get '/files/:name' do
  unless session[:current_customer]
    return redirect '/'
  end
  #File.read params[:name]
  send_file params[:name], disposition: :inline
end

get '/download/:name' do
  unless session[:current_customer]
    return redirect '/'
  end
  if session[:current_customer][:permission] == 'admin'
    send_file params[:name], disposition: :attachment
  else
    redirect '/files'
  end
end
#---------------
get '/stand_by' do
  @vence = request.cookies['vence']
  return erb :index if @vence == nil

  erb :stand_by
end

post '/stand_by' do
  redirect '/stand_by'
end
#----------------
