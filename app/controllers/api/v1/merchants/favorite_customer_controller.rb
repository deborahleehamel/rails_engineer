class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def show
    customers = Merchant.find(params[:id]).favorite_customer
    render json: customers
  end
end
