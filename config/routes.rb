Rails.application.routes.draw do
  resources :users, only: %i[index new create show destroy]
  resources :sessions, only: %i[new create destroy]
  resources :pictures do
    resources :comments
    post :confirm, on: :collection
  end
  resources :relationships, only: %i[create destroy]
  resources :conversations do
    resources :messages
  end
  root to: 'sessions#new'
end
