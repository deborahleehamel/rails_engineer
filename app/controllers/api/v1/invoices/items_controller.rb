class Api::V1::Invoices::ItemsController < ApplicationController
  def index
    render json: invoice.transactions
  end

  private
    def invoice
      Invoice.find(params[:id])
    end
end
