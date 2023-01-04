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
        resources :photos, only: %i[show create destroy]
        resources :money_boxes, only: %i[show simple_money_box create update destroy]
        resources :fundraiser_updates
      end

      resources :donations, only: %i[create update]

      resources :users, only: %i[show update destroy] do
        member do
          get :profile
        end
      end
    end
  end
end

