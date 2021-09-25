# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'

  resources :events
  resources :users, only: %i[show]
  resources :attendances, only: %i[create destroy]
  resources :invitations, only: %i[create destroy index]
  post 'invitation/accept', to: 'invitations#accept'
end
