class Api::V1::Merchants::MostItemsController < ApplicationController
  def show
    @most_items = Merchant.most_items(params[:quantity])
  end
end
