# frozen_string_literal: true

Rails.application.routes.draw do
  root 'bookings#new'

  resources :bookings, only: %i[index new create]
end
