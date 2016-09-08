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
end
