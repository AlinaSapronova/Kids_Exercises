Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root "main#welcome", as: :authenticated_root
  end

  root "main#welcome" 
  get "/profile", to: "profile#show"
  # get "/children", to: "main#get_children"
  # get "/children/new", to: "children#new"
  # get "/children/:child_id", to: "main#show" 
  # get "/children/:child_id/challenges/:ch_id", to: "main#challenges_show"
  # get "/children/:child_id/challenges/:ch_id/days/:day_id", to: 'main#show_day'

  resources :progresses
  resources :challengedays
  resources :exercises
  resources :days
  resources :challenges
  resources :children

  
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
