Rails.application.routes.draw do

root to: "home#index"

resources :users
resources :lists

get "login", to:                  "sessions#new"
post "login", to:                 "sessions#create"
delete '/logout', to:             'sessions#destroy'

end
