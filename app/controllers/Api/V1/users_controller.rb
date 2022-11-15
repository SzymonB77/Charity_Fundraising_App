# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[show update]
      before_action :set_user, only: %i[profile show update]

      # GET /user/1/profile (public)
      def profile
        render json: @user, serializer: ProfileSerializer
      end

      # GET /user/1
      def show
        render json: @user, serializer: UserSerializer
      end

      # PUT /user/1
      def update
        if @user.update(user_params)
          render json: @user, serializer: UserSerializer
        else
          render json: { errors: @user.errors.messages }, status: :unprocessable_entity
        end
      end

      # DELETE /user/1
      def destroy
        render json: @user if @user.destroy
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :name, :surname, :image, :about_me, :website, :city, :zipcode, :street,
                                     :location_number, :phone_number, :company, :company_name, :NIP,
                                     :authentication_method, :daily_donation_limit, :receive_notifications,
                                     :SMS_notifications, :SMS_notifications_amount, :receive_invoices,
                                     :visible_address, :visible_email, :visible_avatar, :visible_phone_number,
                                     :visible_registration_date, :visible_supported_fundraisers,
                                     :visible_in_browser)
      end
    end
  end
end
