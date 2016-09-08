class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    render json: customer.invoices
  end

  private
    def customer
      Customer.find(params[:id])
    end
end
