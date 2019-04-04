Rails.application.routes.draw do
  root to: 'earthquakes#index'
  resources :phone_verifications, :only => [:new, :create] do |p|
    collection do
      get 'challenge'
      post 'verify'
      get 'success'
    end
  end
  namespace :manager do
    resources :catalogs
    resources :commentaries
    resources :earthquakes
    resources :bookings do
      member do
        put :confirm, to: 'bookings#confirm'
      end
    end
    resources :comments
    resources :users
    resources :conferences do
      member do
        put :confirm, to: 'conferences#confirm'
      end
    end
  end
  resources :articles
  resources :conferences
  resources :commentaries do
    member do
      post :accept
    end
  end
  resources :bookings
  resources :earthquakes do
    collection do
      get :select_area
      get :export
      post :export, to: 'earthquakes#load_file'
      get :map
    end
  end
  get 'users/edit_profile', to: 'users#edit_profile'
  get 'users/profile', to: 'users#profile'
  post 'users/update_profile', to: 'users#update_profile'
  devise_for :users
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
end
