class Api::V1::Invoices::CustomersController < ApplicationController
  def show
    render json: invoice.customer
  end

  private
    def invoice
      Invoice.find(params[:id])
    end
end
