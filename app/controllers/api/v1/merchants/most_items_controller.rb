class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    @most_items = Merchant.most_items(params[:quantity])
  end
end
