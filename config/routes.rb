Rails.application.routes.draw do
  resources :users
  root 'sessions#new'
  resources :sessions, only:[:new, :destroy, :create] 
end
