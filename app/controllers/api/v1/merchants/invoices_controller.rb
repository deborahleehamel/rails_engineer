class Api::V1::Merchants::InvoicesController < ApplicationController

  def index
    merchant = Merchant.find(params[:id])
    render json: merchant.invoices
  end
end
