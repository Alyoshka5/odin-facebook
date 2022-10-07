Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  get 'friends/show'
  resources :friend_requests
  resources :friendships
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
end
