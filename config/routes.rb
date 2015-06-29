Rails.application.routes.draw do

root to: "home#index"

resources :tags, only: [:index] 
resources :users
resources :lists do
  resources :tasks
  get "/tasks/completed", to: "tasks#show"
end

get "archived", to:  "lists#archived_index"


get "login", to:     "sessions#new"
post "login", to:    "sessions#create"
delete "logout", to: "sessions#destroy"

end
