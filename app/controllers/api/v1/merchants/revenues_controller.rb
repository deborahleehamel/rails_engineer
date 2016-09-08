class Api::V1::Merchants::RevenuesController < ApplicationController
  def show
    @merchant = merchant
    @revenue = merchant.revenue
  end

  private
    def merchant
      Merchant.find(params[:id])
    end
end
