class Api::V1::Invoices::MerchantsController < ApplicationController
  def show
    render json: invoice.merchant
  end

  private
    def invoice
      Invoice.find(params[:id])
    end
end
