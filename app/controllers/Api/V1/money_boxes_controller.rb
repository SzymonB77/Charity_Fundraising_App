# frozen_string_literal: true

module Api
  module V1
    class MoneyBoxesController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update destroy]
      before_action :set_money_box, only: %i[show update destroy]
      before_action :set_fundraiser, only: %i[create]

      # GET /fundraisers/:id/moneyboxes/:id
      def show
        render json: @money_box, serializer: MoneyBoxSerializer
      end

      # POST /fundraisers/:id/moneyboxes/
      def create
        @money_box = current_api_v1_user.money_boxes.build(money_box_params)
        @money_box.fundraiser = @fundraiser
        if @money_box.save
          render json: @money_box, serializer: MoneyBoxSerializer, status: :created
        else
          render json: @money_box.errors, status: :unprocessable_entity
        end
      end

      # PUT /fundraisers/:id/moneyboxes/:id
      def update
        if @money_box.update(money_box_params)
          render json: @money_box, serializer: MoneyBoxSerializer
        else
          render json: { errors: @money_box.errors.messages }, status: :unprocessable_entity
        end
      end

      # DELETE /fundraisers/:id/moneyboxes/:id
      def destroy
        render json: @money_box if @money_box.destroy
      end

      private

      def set_money_box
        @money_box = MoneyBox.find(params[:id])
      end

      def set_fundraiser
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
      end

      def money_box_params
        params.require(:money_box).permit(:id, :title, :notification, :qrcode, :fundraiser_id, :user_id)
      end
    end
  end
end
