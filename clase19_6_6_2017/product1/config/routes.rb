Rails.application.routes.draw do
  devise_for :users
  resources :invoices #except:['new'] o only: ['new']
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, except: [:new] do
    collection do
      get '/sign_up', to: 'users#sign_up'
    end
  end

  get 'index' => 'index#holi'
  get 'search' => 'users#search'
  get 'table' => 'products#table'
  get 'all' => 'products#all'
  post 'add' => 'products#add'
  root 'products#table'
end
