Rails.application.routes.draw do
  resources :users, only: %i[new create show destroy]
  resources :sessions, only: %i[new create destroy]
end
