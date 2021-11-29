Rails.application.routes.draw do
  # get 'articlepages/index'
  # get 'articles/index'
  resources :articlepages
  resources :articles
  resources :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/home", to: "home#index"
  # get "/dashboard", to: "home#dashboard"
  # get "/dashboard2", to: "home#dashboard2"
  # get 'home/index'
  get "/logout", to: "users#logout"
  get "/new", to: "users#new"
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
