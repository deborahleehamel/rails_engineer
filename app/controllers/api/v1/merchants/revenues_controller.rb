class Api::V1::Merchants::RevenuesController < ApplicationController
  def show
    @merchant = merchant
    @revenue = (merchant.invoices.joins(:transactions, :invoice_items).where("transactions.result = 'success'").sum("invoice_items.unit_price * invoice_items.quantity")/100.0).to_s
  end

  private
    def merchant
      Merchant.find(params[:id])
    end
end
