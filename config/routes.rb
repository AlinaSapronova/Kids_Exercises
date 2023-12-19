Rails.application.routes.draw do

  devise_for :users

  unauthenticated do
    root "main#welcome"
  end

  authenticated :user do
    root "main#welcome", as: :authenticated_root
  end
  
  get "/profile", to: "children#profile"

  resources :progresses
  
  resources :children do
    resources :challenges do
      resources :days do
        resources :exercises
      end
    end
  end

end
