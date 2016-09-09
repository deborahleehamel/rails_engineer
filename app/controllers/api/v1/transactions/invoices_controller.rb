class Api::V1::Transactions::InvoicesController < ApplicationController

  def show
    render json: transaction.invoice
  end

  private

    def transaction
      Transaction.find(params[:id])
    end
end
