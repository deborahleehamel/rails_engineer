class Api::V1::Items::MostItemsController < ApplicationController
  def index
    @items = Item.most_items(params[:quantity])
  end
end
