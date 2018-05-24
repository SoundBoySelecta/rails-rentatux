Rails.application.routes.draw do

  devise_for :users

  root to: 'tuxedos#index'

  resources :tuxedos do
    resources :bookings
  end

  get "dashboard", to: "members#dashboard", as: "dashboard"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
