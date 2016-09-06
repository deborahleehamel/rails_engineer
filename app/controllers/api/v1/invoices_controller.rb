class Api::V1::InvoicesController < ApiController

  def index
    render json: Invoice.all
  end
end
