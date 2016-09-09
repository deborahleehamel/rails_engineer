require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController do
  fixtures :invoice_items
  describe "GET index" do
    it "can get all invoice_items" do
      get :index

      assert_response :success

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to eq 4
    end
  end

  describe "GET show" do
    it "can get a single instance of invoice_item" do
    invoice_item = invoice_items(:one)
      get :show, params: { id: invoice_item.id }

      assert_response :success

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item["id"]).to         eq invoice_item.id
      expect(parsed_invoice_item["quantity"]).to   eq invoice_item.quantity
      expect(parsed_invoice_item["unit_price"]).to eq invoice_item.unit_price
      expect(parsed_invoice_item["invoice_id"]).to eq invoice_item.invoice_id
      expect(parsed_invoice_item["item_id"]).to    eq invoice_item.item_id
    end
  end
end
