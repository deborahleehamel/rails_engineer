class Api::V1::InvoiceItemsController < ApplicationController
  include ApplicationHelper
  
  def index
    render json: InvoiceItem.all
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
  end
end
