Rails.application.routes.draw do

  devise_for :users

  root to: 'tuxedos#index'

  resources :tuxedos do
    resources :bookings
  end

  resources :members, only: [:edit, :show, :update, :destroy]

end
