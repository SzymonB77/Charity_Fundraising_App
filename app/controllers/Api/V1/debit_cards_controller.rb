module Api
  module V1
    class DebitCardsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_debit_card, only: %i[destroy]

      # GET /users/:id/debit_cards/
      def index
        @debit_cards = DebitCard.all
        render json: @debit_cards, each_serializer: DebitCardSerializer
      end

      # POST /users/:id/debit_cards/
      def create
        @debit_card = current_api_v1_user.debit_cards.build(debit_card_params)
        if @debit_card.save
          render json: @debit_card, serializer: DebitCardSerializer, status: :created
        else
          render json: @debit_card.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/:id/debit_cards/:id
      def destroy
        render json: @debit_card if @debit_card.destroy
      end

      private

      def set_debit_card
        @debit_card = DebitCard.find(params[:id])
      end

      def debit_card_params
        params.require(:debit_card).permit(:id, :card_number, :expiration_date, :cvv)
      end
    end
  end
end
