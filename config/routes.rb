Rails.application.routes.draw do
  root to: 'home#index'

  match '/users/',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  devise_for :users do
    devise_for :users, :path_prefix => 'd'
    resources :users, :only =>[:show]
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
