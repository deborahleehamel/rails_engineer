class Api::V1::Items::FindController < ApplicationController

  def show
    render json: Item.where(item_params).first
  end

  private

    def item_params
      params.permit(
        :id,
        :name,
        :description,
        :unit_price, 
        :created_at,
        :updated_at,
        :merchant_id
      )
    end

    def convert_to_integer
      params[:unit_price] = params[:unit_price].delete(".").to_i if params[:unit_price]
    end

end
