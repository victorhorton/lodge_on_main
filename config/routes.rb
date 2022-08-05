Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'access#home'
  resources :events, only: :index
  resources :lodgings, only: :index
  resources :merchandise, only: :index
  resources :photos, only: :index
  resources :taps, only: :index
end
