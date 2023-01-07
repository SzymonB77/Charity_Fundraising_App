# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :fundraisers do
        collection do
          get :latest
          get :random
          get :mostviewed
        end
        member do
          post :observe_fundraiser
          delete :destroy_observe_fundraiser
        end

        resources :photos, only: %i[show create destroy]
        resources :money_boxes, only: %i[show simple_money_box create update destroy]
        resources :fundraiser_updates
      end

      resources :donations, only: %i[create update]

      resources :invoices, only: %i[create update destroy]
      resources :users, only: %i[show update destroy] do
        member do
          get :profile
        end
        resources :debit_cards, only: %i[index create destroy]
        resources :identity_cards
      end
    end
  end
end
