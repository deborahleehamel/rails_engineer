class Api::V1::Merchants::CustomerPendingInvoicesController  < ApplicationController

  def index
    customers = Merchant.find(params[:id]).customers.joins("INNER JOIN transactions ON transactions.invoice_id = invoices.id").where("transactions.result = 'failed'").distinct
    render json: customers
  end
end
