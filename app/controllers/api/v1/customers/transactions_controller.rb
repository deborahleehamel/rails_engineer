class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    render json: customer.transactions
  end

  private
    def customer
      Customer.find(params[:id])
    end
end
