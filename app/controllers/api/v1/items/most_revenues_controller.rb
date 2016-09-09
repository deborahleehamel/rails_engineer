class Api::V1::Items::MostRevenuesController < ApplicationController
  def index
    @items = Item.most_revenue(params[:quantity])
  end
end
