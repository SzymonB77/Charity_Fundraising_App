module Api
  module V1
    class FundraiserUpdatesController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update destroy]
      before_action :set_fundraiser_update, only: %i[show update destroy]
      before_action :set_fundraiser, only: %i[create]

      # GET /fundraisers/:id/fundriser_updates/:id
      def show
        render json: @fundraiser_update, serializer: FundraiserUpdateSerializer
      end

      # POST /fundraisers/:id/fundriser_updates
      def create
        @fundraiser_update = FundraiserUpdate.new(fundraiser_update_params)
        @fundraiser_update.fundraiser = @fundraiser
        if @fundraiser_update.save
          render json: @fundraiser_update, serializer: FundraiserUpdateSerializer, status: :created
        else
          render json: @fundraiser_update.errors, status: :unprocessable_entity
        end
      end

      # PUT /fundraisers/:id/fundriser_updates/:id
      def update
        if @fundraiser_update.update(fundraiser_update_params)
          render json: @fundraiser_update, serializer: FundraiserUpdateSerializer
        else
          render json: { errors: @fundraiser_update.errors.messages }, status: :unprocessable_entity
        end
      end

      # DELETE /fundraisers/:id/fundriser_updates/:id
      def destroy
        render json: @fundraiser_update if @fundraiser_update.destroy
      end

      private

      def set_fundraiser_update
        @fundraiser_update = FundraiserUpdate.find(params[:id])
      end

      def set_fundraiser
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
      end

      def fundraiser_update_params
        params.require(:fundraiser_update).permit(:id, :note, :fundraiser_id)
      end
    end
  end
end
