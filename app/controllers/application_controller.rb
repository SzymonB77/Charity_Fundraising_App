# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend
  include DeviseTokenAuth::Concerns::SetUserByToken
end
