Rails.application.routes.draw do
  root 'pages#home'

  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :edit, :update]
  resources :posts, only: [:index, :show, :create, :destroy, :edit, :update]
  resources :follows, only: [:create, :destroy]

  get '/profile/:id', to: "users#show", as: "user"
  get '/profile/:id/followings', to: "users#followings", as: "following"
  get '/profile/:id/followers', to: "users#followers", as: "followers"
  post '/users/search', to: "users#show", as: :search
  get '/users/search', to: "users#show"

  devise_for :users, :controllers => {registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
