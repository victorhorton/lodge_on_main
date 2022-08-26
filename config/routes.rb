Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'access#home'
  get '/about-us', to: 'access#about_us'
  get 'location', to: 'access#locations'
  resources :events
  resources :lodgings, only: :index
  resources :merchandise, only: :index
  resources :photos, only: [:index, :new, :create, :show, :destroy]
  resources :taps, path: 'taproom', only: [:index, :edit, :update, :show]
  resources :store_hours, path: 'hours', only: [:new, :create, :edit, :update, :destroy]
end
