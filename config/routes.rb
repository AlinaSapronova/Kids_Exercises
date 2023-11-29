Rails.application.routes.draw do
  resources :progresses
  resources :challengedays
  resources :exercises
  resources :days
  resources :challenges
  resources :children
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
