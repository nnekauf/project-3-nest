Rails.application.routes.draw do
  resources :readers do #readers have goals
    resources :goals
  end

  resources :goals do #goals have many plots associated with them
    resources :plots
  end

  resources :goals
  # resources :books
  # resources :plots
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
