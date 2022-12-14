Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'friends/index'
  get 'friends/destroy'
  get 'friends/show'
  get 'posts/like', to: 'posts#like'
  get 'posts/unlike', to: 'posts#unlike'
  
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :friend_requests
  resources :friendships
  resources :users
  resources :posts do
    resources :comments
  end
  resources :profiles

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
end
