Rails.application.routes.draw do
  root "home#top"
  get "/about", to: "home#about"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/likes/:post_id/create", to: "likes#create"
  delete "/likes/:post_id/destroy", to: "likes#destroy"
  get "/users/:id/likes", to: "users#likes"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resources :comments,    only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
