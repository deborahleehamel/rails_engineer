class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    render json: invoice.invoice_items
  end

  private
    def invoice
      Invoice.find(params[:id])
    end
end
