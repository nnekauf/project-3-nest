
  Rails.application.routes.draw do
    get '/', to: "readers#welcome"

    get '/signup', to: "readers#new", as: "signup"
    post '/signup', to: "readers#create"

    get '/login', to: "sessions#new", as: "login"
    post '/login', to: "sessions#create"
    post '/logout', to: "sessions#destroy"

    get "/auth/facebook/callback", to: "sessions#create_with_fb"

    resources :readers
    resources :books do 
      resources :reviews
    end

    resources :reviews
  #   resources :readers, except: [:new, :create] do #readers have books
  #     resources :books
  #   end
  
  #   resources :authors do 
  #     resources :books
  #   end
  
   
    
  #   resources :books do
  #     resources :readers
  #     resources :authors
  #   end
  #   # resources :plots
    # get '/home', to: "readers#home"
  
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end