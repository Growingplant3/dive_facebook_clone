Rails.application.routes.draw do
  resources :users, only: %i[new create show destroy]
  resources :sessions, only: %i[new create destroy]
  resources :pictures do
    post :confirm, on: :collection
  end
  root to: 'sessions#new'
end
