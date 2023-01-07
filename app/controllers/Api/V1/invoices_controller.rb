# frozen_string_literal: true

module Api
  module V1
    class InvoicesController < ApplicationController
      before_action :set_invoice, only: %i[update destroy]

      # (in the future I will add an admin and he only will be able to operate it)

      # POST /invoices
      def create
        @invoice = Invoice.new(invoice_params)
        if @invoice.save
          render json: @invoice, serializer: InvoiceSerializer, status: :created
        else
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end

      # PUT /invoices/:id
      def update
        if @invoice.update(invoice_params)
          render json: @invoice, serializer: InvoiceSerializer
        else
          render json: { errors: @invoice.errors.messages }, status: :unprocessable_entity
        end
      end

      # DELETE /invoices/:id
      def destroy
        render json: @invoice if @invoice.destroy
      end

      private

      def set_invoice
        @invoice = Invoice.find(params[:id])
      end

      def invoice_params
        params.require(:invoice).permit(:id, :title, :invoice_link, :user_id)
      end
    end
  end
end
