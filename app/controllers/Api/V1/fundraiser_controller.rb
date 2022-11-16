# frozen_string_literal: true

module Api
  module V1
    class FundraiserController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[update]
      before_action :set_user, only: %i[update]

      # GET /fundraiser/1
      def show
        render json: @fundraiser, serializer: FundraiserSerializer
      end

      # PUT /fundraiser/1
      def update
        if @fundraiser.update(fundraiser_params)
          render json: @fundraiser, serializer: FundraiserSerializer
        else
          render json: { errors: @fundraiser.errors.messages }, status: :unprocessable_entity
        end
      end

      private

      def set_fundraiser
        @fundraiser = Fundraiser.find(params[:id])
      end

      def fundraiser_params
        params.require(:fundraiser).permit(:id, :title, :date_of_birth, :name, :surname, :reason, :city, :region,
                                           :end_date, :discription, :total_amount)
      end
    end
  end
end
