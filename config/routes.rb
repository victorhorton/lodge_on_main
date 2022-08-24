Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'access#home'
  get '/about-us', to: 'access#about_us'
  resources :events
  resources :lodgings, only: :index
  resources :merchandise, only: :index
  resources :photos, only: [:index, :new, :create, :show, :destroy]
  resources :taps, only: [:index, :edit, :update, :show]
end
