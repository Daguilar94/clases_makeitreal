Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'table' => 'products#table'
  get 'all' => 'products#all'
  post 'add' => 'products#add'
  root 'products#table'
end
