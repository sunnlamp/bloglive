Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users do
    devise_for :users, :path_prefix => 'd'
    resources :users, :only => [:show]
    member do
      get :following, :followers
    end
  end

  match '/users/',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  resources :posts do
    resources :feed, :only => [:index]
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
