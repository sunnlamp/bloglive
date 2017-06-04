Rails.application.routes.draw do
  resources :comments
  root to: 'home#index'
  devise_for :users
  resources :posts

  resources :users do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
