Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'access#home'
  get '/about-us', to: 'access#about_us'
  get 'location', to: 'access#locations'
  resources :events
  resources :users, only: [:new, :create, :edit, :update] do
    collection do
      get :login
      post :attempt_login
      get :log_out
    end
  end
  resources :lodgings, only: :index
  resources :merchandise, only: :index
  # resources :photos, only: [:index, :new, :create, :show, :destroy]
  resources :taps, path: 'taproom', only: [:index, :edit, :update, :show]
  resources :store_hours, path: 'hours'
end
