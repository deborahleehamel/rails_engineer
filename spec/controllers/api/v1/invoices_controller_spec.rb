require 'rails_helper'

RSpec.describe Api::V1::InvoicesController do
  fixtures :invoices
  describe "GET index" do
    it "can get all invoices" do
      get :index

      assert_response :success

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 6
    end
  end

  describe "GET show" do
    it "can get a single invoice" do
      invoice = invoices(:one)
      get :show, params: { id: invoice.id }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["status"]).to      eq invoice.status
      expect(parsed_invoice["customer_id"]).to eq invoice.customer_id
      expect(parsed_invoice["merchant_id"]).to eq invoice.merchant_id
    end
  end
end
