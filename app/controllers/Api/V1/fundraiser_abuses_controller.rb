module Api
  module V1
    class FundraiserAbusesController < ApplicationController
      before_action :set_fundraiser, only: %i[create]
      before_action :set_fundraiser_abuse, only: %i[destroy]

      # GET /fundriser_abuses
      def index
        @fundraiser_abuse = FundraiserAbuse.all
        render json: @fundraiser_abuse, each_serializer: FundraiserAbuseSerializer
      end

      # POST /fundraisers/:id/fundriser_abuses
      def create
        @fundraiser_abuse = FundraiserAbuse.new(fundraiser_abuse_params)
        @fundraiser_abuse.fundraiser = @fundraiser
        if @fundraiser_abuse.save
          render json: @fundraiser_abuse, serializer: FundraiserAbuseSerializer, status: :created
        else
          render json: @fundraiser_abuse.errors, status: :unprocessable_entity
        end
      end

      # DELETE /fundraisers/:id/fundriser_abuses/:id OR /fundriser_abuses/:id
      def destroy
        render json: @fundraiser_abuse if @fundraiser_abuse.destroy
      end

      private

      def set_fundraiser
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
      end

      def set_fundraiser_abuse
        @fundraiser_abuse = FundraiserAbuse.find(params[:id])
      end

      def fundraiser_abuse_params
        params.require(:fundraiser_abuse).permit(:id, :note, :phone_number, :attachment)
      end
    end
  end
end
