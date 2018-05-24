Rails.application.routes.draw do

  devise_for :users

  root to: 'tuxedos#index'

  resources :tuxedos do
    resources :bookings, except: [:update]
  end
  resources :bookings, only: [:update]


  get "dashboard", to: "members#dashboard", as: "dashboard"
  resources :members, only: [:edit, :show, :update, :destroy]
end
