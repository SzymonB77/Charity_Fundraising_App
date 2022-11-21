# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :fundraiser do
        collection do
          get :lastest
          get :random
          get :mostviewed
        end
      end

      resources :users, only: %i[show update destroy] do
        member do
          get :profile
        end
      end
    end
  end
end

# resources :profile, only: [:show] do
#   namespace :settings do
#     resources :edit, only: [:index, :update]
#     #resources :phone_number, only: [:index, :update]
#     resources :profile_setup, only: [:index, :update]
#     #esources :change_password, only: [:update]
#     resources :limits, only: [:index, :update]
#     # resources :invoices, only: [:index, :update]
#     # resources :login_history, only: [:index]
#   end
# end
