Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "watchlist_items#index"

  get "/signup", to: "users#new", as: :signup
  post "/signup", to: "users#create"

  get "login", to: "session#new", as: :login
  post "login", to: "session#create"
  delete "logout", to: "session#destroy", as: :logout

  resources :watchlist_items, only: [:index, :create, :update, :destroy]

  get "movies/search", to: "movies_search#search", as: :search_movies
end
