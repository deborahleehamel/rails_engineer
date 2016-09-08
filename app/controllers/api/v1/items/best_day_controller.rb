class Api::V1::Items::BestDayController < ApplicationController

  def show
    item = Item.find(params[:id])
    render json: item.best_day
  end

end
