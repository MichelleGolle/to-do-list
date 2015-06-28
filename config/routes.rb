Rails.application.routes.draw do

root to: "home#index"

resources :users
resources :lists do
  resources :tasks
end

get "archived", to:  "lists#archived_index"
get "lists/:id/completed", to:  "tasks#completed_index", as: :completed_tasks


get "login", to:     "sessions#new"
post "login", to:    "sessions#create"
delete "logout", to: "sessions#destroy"

end
