class Api::V1::Invoices::RandomController < ApplicationController

  def show
    rand_id = Invoice.random_id
    render json: Invoice.find(rand_id)
  end

end
