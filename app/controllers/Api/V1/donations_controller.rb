# frozen_string_literal: true

module Api
  module V1
    class DonationsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_donation, only: %i[update]

      # POST /donations
      def create
        @donation = current_api_v1_user.donations.build(donation_params)

        if @donation.save
          render json: @donation, serializer: DonationSerializer, status: :created
        else
          render json: @donation.errors, status: :unprocessable_entity
        end
      end

      # PUT /donations/:id (payment acceptance)
      def update
        if @donation.update(acceptance_donation_params)
          render json: @donation, serializer: DonationSerializer
        else
          render json: @donation.errors, status: :unprocessable_entity
        end
      end

      private

      def set_donation
        @donation = Donation.find(params[:id])
      end

      def donation_params
        params.require(:donation).permit(:id, :amount, :note, :hidden_amount, :hidden_name, :user_id, :fundraiser_id,
                                         :money_box_id)
      end

      # Only for payment acceptance
      def acceptance_donation_params
        params.require(:donation).permit(:payment_successed)
      end
    end
  end
end
