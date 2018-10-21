Rails.application.routes.draw do
  root 'sessions#new'
  resources :users do
    resources :chats, only: [:index, :show, :create]
  end
  resources :sessions, only:[:new, :destroy, :create] 
end
