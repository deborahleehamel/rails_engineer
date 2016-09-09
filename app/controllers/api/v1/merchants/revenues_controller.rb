class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    @revenue = Merchant.total_revenue(params[:date])
  end

  def show
    @revenue =
    if params[:date]
      merchant.revenue_by_date(params[:date])
    else
      merchant.revenue
    end
  end

  private
    def merchant
      Merchant.find(params[:id])
    end
end
