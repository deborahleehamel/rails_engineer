require "rails_helper"

RSpec.describe Api::V1::Invoices::InvoiceItemsController do
  fixtures :invoices
  fixtures :invoice_items
  describe "GET index" do
    it "can get all invoice items for a given invoice" do
      invoice = invoices(:one)
      get :index, id: invoice.id

      expect(response.status).to eq 200

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to eq 2
    end
  end
end
