
  Rails.application.routes.draw do
    get '/', to: "readers#welcome" #all good

    get '/signup', to: "readers#new", as: "signup"
    post '/signup', to: "readers#create"

    get '/login', to: "sessions#new", as: "login"
    post '/login', to: "sessions#create"
    post '/logout', to: "sessions#destroy"

    get "/auth/facebook/callback", to: "sessions#create_with_fb"

    get '/home', to: "readers#home"

    resources :readers, except: [:show, :index, :new, :create, :destroy, :patch, :put, :edit]  do
      resources :books, only: [:index] 
      resources :reviews, only: [:index, :new, :create, :patch, :put, :edit] 
    end

    resources :books, only: [:index, :show] do 
      resources :reviews, only: [:index, :new, :create] 
    end

    resources :reviews, only: [:show]
  
    
  
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end