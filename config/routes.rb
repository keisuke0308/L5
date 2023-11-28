Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :destroy]
  resources :tweets, only: [:index, :new, :create, :destroy]

  get 'top/main'
  get 'top/login_move'
  post 'top/login'
  get 'top/logout'
  
  get 'likes/create'
  get 'likes/destroy'

  root 'users#index'
  post "users/create"
end
