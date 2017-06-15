Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users do
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

  resources :relationships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
