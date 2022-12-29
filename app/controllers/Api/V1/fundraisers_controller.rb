# frozen_string_literal: true

module Api
  module V1
    class FundraisersController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update]
      before_action :set_user, only: %i[update]
      before_action :set_fundraiser, only: %i[show update]

      # before_action :set_donation
      after_action { pagy_headers_merge(@pagy) if @pagy }

      # GET /fundraiser
      def index
        @pagy, @fundraisers = pagy(Fundraiser.all)

        render json: @fundraisers, each_serializer: SimpleFundraiserSerializer
      end

      # GET /fundraiser/1
      def show
        @fundraiser.increment
        render json: @fundraiser, serializer: FundraiserSerializer
      end

      # GET /fundraiser/lastest
      def lastest
        @pagy, @lastest_fundraisers = pagy(Fundraiser.order(created_at: :desc))

        render json: @lastest_fundraisers, each_serializer: SimpleFundraiserSerializer
      end

      # GET /fundraiser/random
      def random
        @pagy, @random_fundraisers = pagy(Fundraiser.order('RANDOM()'))

        render json: @random_fundraisers, each_serializer: SimpleFundraiserSerializer
      end

      # GET /fundraiser/mostviewed
      def mostviewed
        @pagy, @most_viewed_fundraisers = pagy(Fundraiser.order(count: :desc))

        render json: @most_viewed_fundraisers, each_serializer: SimpleFundraiserSerializer
      end

      # POST /fundraiser
      def create
        @fundraiser = current_api_v1_user.fundraisers.build(fundraiser_params)
        if @fundraiser.save
          render json: @fundraiser, serializer: FundraiserSerializer, status: :created
        else
          render json: @fundraiser.errors, status: :unprocessable_entity
        end
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

      def set_user
        @user = User.find(params[:id])
      end

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