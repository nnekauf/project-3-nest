
  Rails.application.routes.draw do
    get '/', to: "readers#welcome" #all good

    get '/signup', to: "readers#new", as: "signup" #all good
    post '/signup', to: "readers#create"

    get '/login', to: "sessions#new", as: "login" #all good
    post '/login', to: "sessions#create"
    post '/logout', to: "sessions#destroy" #all good

    get "/auth/facebook/callback", to: "sessions#create_with_fb" #all good

    get '/home', to: "readers#home" #all good

    resources :readers, except: [:show, :index, :new, :create, :destroy, :patch, :put, :edit]  do
      resources :books, only: [:index] 
      resources :reviews, only: [:index, :new, :create, :patch, :put, :edit] #must fix new review route
    end

    resources :books, only: [:index, :show] do 
      resources :reviews, only: [:index, :new, :create] 
    end

    resources :reviews, only: [:show]
  
    
  #fix scope to only show items that the current_user owns
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end