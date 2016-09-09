class Api::V1::Customers::FavoriteMerchantsController < ApplicationController
  def show
    @merchant = customer.favorite_merchant
  end

  private
    def customer
      Customer.find(params[:id])
    end
end
