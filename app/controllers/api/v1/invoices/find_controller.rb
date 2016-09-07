class Api::V1::Invoices::FindController < ApplicationController

  def index
    render json: Invoice.where(invoice_params)
  end

  private

    def invoice_params
      params.permit(:id, :status, :created_at, :updated_at, :merchant_id, :customer_id)
    end
end
