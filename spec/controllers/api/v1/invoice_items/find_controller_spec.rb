require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::FindController do
  fixtures :invoice_items
  describe "GET index//Multi-Finders" do
    it "can get all instances of invoice_items by ID" do
      invoice_item = invoice_items(:one)
      get :index, params: { id: invoice_item.id }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to       eq 1
      expect(parsed_invoice_items.first["id"]).to eq 3
      expect(parsed_invoice_items.first["id"]).to eq invoice_item.id

    end

    it "can get all invoices by ITEM_ID" do
      invoice_item = invoice_items(:one)
      get :index, params: { item_id: invoice_item.item_id }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to                eq 1
      expect(parsed_invoice_items.first["item_id"]).to eq 298486374
      expect(parsed_invoice_items.last["item_id"]).to  eq 298486374
    end

    it "can get all invoices by INVOICE_ID" do
      invoice_item = invoice_items(:one)
      get :index, params: { invoice_id: invoice_item.invoice_id }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to                eq 2
      expect(parsed_invoice_items.first["invoice_id"]).to eq 980190962
      expect(parsed_invoice_items.last["invoice_id"]).to  eq 980190962
    end

    it "can get all invoices by QUANTITY" do
      invoice = invoices(:one)
      get :index, params: { quantity: invoice_item.quantity }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to eq 4
      expect(parsed_invoice_items.first["quantity"]).to eq 980190962
      expect(parsed_invoice_items.last["quantity"]).to  eq 980190962
    end

    it "can get all invoices by UNIT_PRICE" do
      invoice_item = invoice_items(:one)
      get :index, params: { unit_price: invoice.unit_price }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to eq 2
      expect(parsed_invoice_items.first["quantity"]).to eq "shipped"
      expect(parsed_invoice_items.last["quantity"]).to  eq "shipped"
    end

    it "can get all invoices by CREATED_AT" do
      invoice_item = invoice_items(:one)
      get :index, params: { created_at: invoice_item.created_at }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to eq 2
      expect(parsed_invoice_items.first["quantity"]).to eq 3
      expect(parsed_invoice_items.last["item_id"]).to  eq "one"
    end

    it "can get all invoices by UPDATED_AT" do
      invoice_item = invoice_items(:one)
      get :index, params: { updated_at: invoice_item.updated_at }

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to             eq 2
      expect(parsed_invoice_items.first["quantity"]).to eq 3
      expect(parsed_invoice_items.last["item_id"]).to      eq "one"
    end
  end

  describe "GET show//Single Finders" do
    it "can get a single instance of invoice_item by ID" do
      invoice_item = invoice_items(:two)
      get :show, params: { id: invoice_item.id }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice_item["id"]).to      eq 298486374
      expect(parsed_invoice_item["id"]).to      eq invoice_item.id
      expect(parsed_invoice_item["status"]).to  eq invoice_item.status
    end

    it "can get a single instance of invoice by CUSTOMER ID" do
      invoice = invoices(:two)
      get :show, params: { customer_id: invoice.customer_id }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["customer_id"]).to eq 298486374
    end

    it "can get a single instance of invoice by MERCHANT ID" do
      invoice = invoices(:two)
      get :show, params: { merchant_id: invoice.merchant_id }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["merchant_id"]).to eq 980190962
    end

    it "can get a single instance of invoice by STATUS" do
      invoice = invoices(:two)
      get :show, params: { status: invoice.status }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice_item["id"]).to          eq invoice_item.id
      expect(parsed_invoice_item["status"]).to      eq invoice_item.status
      expect(parsed_invoice_item["customer_id"]).to eq invoice_item.customer_id
      expect(parsed_invoice_item["merchant_id"]).to eq invoice_item.merchant_id
    end

    it "can get a single instance of invoice by CREATED_AT" do
      invoice_item = invoice_items(:two)
      get :show, params: { created_at: invoice_item.created_at }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to             eq 2
      expect(parsed_invoice_items.first["quantity"]).to eq 3
      expect(parsed_invoice_item["id"]).to              eq invoice_item.id
    end

    it "can get a single instance of invoice by UPDATED_AT" do
      invoice_item = invoice_items(:two)
      get :show, params: { updated_at: invoice_item.updated_at }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to             eq 2
      expect(parsed_invoice_items.first["quantity"]).to eq 3
      expect(parsed_invoice_item["id"]).to              eq invoice_item.id
    end
  end
end
