Rails.application.routes.draw do
  resources :posts

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
