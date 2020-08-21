Rails.application.routes.draw do
  resources :foods, only: [:index, :show, :new, :create]
  resources :eaters, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/signup", to: "eaters#new", as: "signup"
  post "/signup", to: "eaters#create"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
end
