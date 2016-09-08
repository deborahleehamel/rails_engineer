class Api::V1::Merchants::CustomerPendingInvoicesController  < ApplicationController

  def index
    customers = Merchant.find(params[:id]).customers_pending_invoices
    render json: customers
  end
end
