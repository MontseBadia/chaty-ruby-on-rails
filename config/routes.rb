Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root 'chats#index'
  resources :users do
    resources :chats, only: [:index, :show, :create]
  end
  resources :sessions, only:[:new, :destroy, :create] 
  resources :messages, only:[:create]
end
