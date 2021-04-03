Rails.application.routes.draw do
  resources :readers, except: [:new, :create] do #readers have goals
    resources :(goals, except: [:show, :edit, :update, :destroy, :put])
    resources :(books, except: [:show, :edit, :update, :destroy, :put])
  end

  resources (books, :except: [:put, :edit, :patch, :destroy, :update]) do
    resources :goals, only: [:new, :create]
  end
  

  resources :goals
  resources :books
  # resources :plots
  get '/signup', to: "readers#new", as: "signup"
  post '/signup', to: "readers#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#create_with_fb"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
