class Api::V1::ItemsController < ApplicationController
  include ApplicationHelper
  
  def index
    render json: Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
