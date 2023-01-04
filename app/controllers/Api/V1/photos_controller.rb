module Api
  module V1
    class PhotosController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create destroy]
      before_action :set_photo, only: %i[show destroy]
      before_action :set_fundraiser, only: %i[create]

      # GET /fundraisers/:id/photos/:id
      def show
        render json: @photo, serializer: PhotoSerializer
      end

      # POST /fundraisers/:id/photos/
      def create
        @photo = Photo.new(photo_params)
        @photo.fundraiser = @fundraiser
        if @photo.save
          render json: @photo, serializer: PhotoSerializer, status: :created
        else
          render json: @photo.errors, status: :unprocessable_entity
        end
      end

      # DELETE /fundraisers/:id/photos/:id
      def destroy
        render json: @photo if @photo.destroy
      end

      private

      def set_photo
        @photo = Photo.find(params[:id])
      end

      def set_fundraiser
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
      end

      def photo_params
        params.require(:photo).permit(:id, :photo, :fundraiser_id)
      end
    end
  end
end
