# frozen_string_literal: true

module Api
  module V1
    class IdentityCardsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_identity_card, only: %i[show destroy]

      # GET /users/:id/identity_cards/:id
      def show
        render json: @identity_card, serializer: IdentityCardSerializer
      end

      # POST /users/:id/identity_cards/
      def create
        @identity_card = current_api_v1_user.build_identity_card(identity_card_params)
        if @identity_card.save
          render json: @identity_card, serializer: IdentityCardSerializer, status: :created
        else
          render json: @identity_card.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/:id/identity_cards/:id
      def destroy
        render json: @identity_card if @identity_card.destroy
      end

      private

      def set_identity_card
        @identity_card = IdentityCard.find(params[:id])
      end

      def identity_card_params
        params.require(:identity_card).permit(:id, :name, :surname, :citizenship, :country_of_birth, :sex, :pesel,
                                              :series_and_number, :expiration_date, :street, :house_number, :city, :zipcode)
      end
    end
  end
end
