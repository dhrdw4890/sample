Rails.application.routes.draw do
  root "home#top"
  get "/about", to: "home#about"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts
  resources :relationships, only: [:create, :destroy]
  resources :likes,         only: [:create, :destroy]
end
