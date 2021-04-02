Rails.application.routes.draw do
  resources :readers, except: [:new] do #readers have goals
    resources :goals
  end

  resources :goals do #goals have many plots associated with them
    resources :plots
  end

  resources :goals
  # resources :books
  # resources :plots
  get '/signup', to: "readers#new", as: "new_reader"
  get '/login', to: "sessions#new", as: "new_reader"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
