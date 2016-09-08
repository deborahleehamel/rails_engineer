class Api::V1::Merchants::RevenuesController < ApplicationController
  def show
    @merchant = merchant
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
