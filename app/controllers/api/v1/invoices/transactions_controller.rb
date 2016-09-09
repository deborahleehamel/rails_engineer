class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    @transactions = invoice.transactions
  end

  private
    def invoice
      Invoice.find(params[:id])
    end
end
