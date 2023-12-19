Rails.application.routes.draw do

  devise_for :users

  unauthenticated do
    root "main#welcome"
  end

  authenticated :user do
    root "main#welcome", as: :authenticated_root
  end
  
  get "/profile", to: "profile#show"

  resources :progresses
  
  resources :children do
    resources :challenges do
      resources :days do
        resources :exercises
      end
    end
  end
  

  
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
