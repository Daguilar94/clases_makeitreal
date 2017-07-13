Rails.application.routes.draw do

  resources :posts, only: [:index, :show] do
    resources :comments
  end

  resources :users, except: [:index, :create, :new] do
    resources :posts, except: [:index]
    member do
      get 'posts'
    end
  end
  devise_for :users, path: 'auth'

  root 'index#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
