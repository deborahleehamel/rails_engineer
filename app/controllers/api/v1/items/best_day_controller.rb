class Api::V1::Items::BestDayController < ApplicationController

  def show
    @date = item.best_day
  end

  private

  def item
    Item.find(params[:id])
  end
end
