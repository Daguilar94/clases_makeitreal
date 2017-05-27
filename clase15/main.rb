lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'sinatra'
require 'sinatra/reloader' if development?
require 'makeitreal'

users = [
  Makeitreal::Models::User.new('d@ex.com', 'David', 'admin'),
  Makeitreal::Models::User.new('s@ex.com', 'Santiago', 'eng'),
  Makeitreal::Models::User.new('fe@ex.com', 'Felipe', 'admin'),
]

get '/' do
  erb :index
end

get '/generate_report' do #Generar en runtime, así no crea el archivo
  content = Makeitreal::Reporters::Users::Csv.generate users
  content_type 'application/csv'
  attachment 'users_report2.csv'
  content
end

get 'create_report' do
  file = Makeitreal::Reporters::Users::Csv.report users
  send_file file.path, disposition: :attachment, type: 'application/csv'
end

get '/upload_file' do
  erb :upload_file
end

post '/upload_file' do
  puts "FILE= #{params[:file]}"
  tempfile = params[:file][:tempfile]
  filename = params[:file][:filename]
  name = params[:name]
  upload_path =File.join '.', 'uploads', "#{name}_#{filename}"
  File.open upload_path, 'wb' do |file| # el 'wb' es porque es un archivo binario
    file.write tempfile.read
  end
end
