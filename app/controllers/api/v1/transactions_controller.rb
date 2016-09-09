class Api::V1::TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def show
    render json: Transaction.find(params[:id])
  end
end
