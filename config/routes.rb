Rails.application.routes.draw do
  root 'chats#index'
  resources :users do
    resources :chats, only: [:index, :show, :create]
  end
  resources :sessions, only:[:new, :destroy, :create] 
end
