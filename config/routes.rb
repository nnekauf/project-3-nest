Rails.application.routes.draw do
  resources :readers, except: [:new, :create] do #readers have goals
    resources :goals
  end

  resources :goals do #goals have many plots associated with them
    resources :plots
  end

  resources :goals
  # resources :books
  # resources :plots
  get '/signup', to: "readers#new", as: "signup"
  post '/signup', to: "readers#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
