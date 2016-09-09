class Api::V1::Merchants::MostRevenueController  < ApplicationController

  def index
    @merchants =  Merchant.most_revenue(params[:quantity])
  end
end
