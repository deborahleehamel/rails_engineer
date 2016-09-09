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

    it "can get all invoice_items by ITEM_ID" do
      invoice_item = invoice_items(:one)
      get :index, params: { item_id: invoice_item.item_id }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to            eq 1
      expect(parsed_invoice_items.first["item_id"]).to eq 298486374
      expect(parsed_invoice_items.last["item_id"]).to  eq 298486374
    end

    it "can get all invoice_items by INVOICE_ID" do
      invoice_item = invoice_items(:one)
      get :index, params: { invoice_id: invoice_item.invoice_id }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to               eq 2
      expect(parsed_invoice_items.first["invoice_id"]).to eq 980190962
      expect(parsed_invoice_items.last["invoice_id"]).to  eq 980190962
    end

    it "can get all invoice_items by QUANTITY" do
      invoice_item = invoice_items(:one)
      get :index, params: { quantity: invoice_item.quantity }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to eq 2
      expect(parsed_invoice_items.first["quantity"]).to eq 3
      expect(parsed_invoice_items.last["quantity"]).to  eq 3
    end

    it "can get all invoice_items by UNIT_PRICE" do
      invoice_item = invoice_items(:one)
      get :index, params: { unit_price: "911.11" }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to               eq 1
      expect(parsed_invoice_items.first["unit_price"]).to eq 91111
    end

    it "can get all invoice_items by CREATED_AT" do
      invoice_item = invoice_items(:one)
      get :index, params: { created_at: invoice_item.created_at }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to eq 2
      expect(parsed_invoice_items.first["quantity"]).to eq 3
      expect(parsed_invoice_items.last["item_id"]).to   eq 980190962
    end

    it "can get all invoice_items by UPDATED_AT" do
      invoice_item = invoice_items(:one)
      get :index, params: { updated_at: invoice_item.updated_at }

      parsed_invoice_items = JSON.parse(response.body)

      expect(parsed_invoice_items.count).to             eq 2
      expect(parsed_invoice_items.first["quantity"]).to eq 3
      expect(parsed_invoice_items.last["item_id"]).to   eq 980190962
    end
  end

  describe "GET show//Single Finders" do
    it "can get a single instance of invoice_item by ID" do
      invoice_item = invoice_items(:two)
      get :show, params: { id: invoice_item.id }

      assert_response :success

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item["id"]).to          eq 298486374
      expect(parsed_invoice_item["id"]).to          eq invoice_item.id
      expect(parsed_invoice_item["quantity"]).to    eq 7
      expect(parsed_invoice_item["unit_price"]).to  eq 6

    end

    it "can get a single instance of invoice by ITEM_ID" do
      invoice_item = invoice_items(:two)
      get :show, params: { item_id: invoice_item.item_id }

      assert_response :success

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item["item_id"]).to eq 980190962
    end

    it "can get a single instance of invoice by INVOICE_ID" do
      invoice_item = invoice_items(:two)
      get :show, params: { invoice_id: invoice_item.invoice_id }

      assert_response :success

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item["invoice_id"]).to eq 298486374
    end

    it "can get a single instance of invoice by QUANTITY" do
      invoice_item = invoice_items(:two)
      get :show, params: { quuantity: invoice_item.quantity }

      assert_response :success

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item["quantity"]).to eq 3
    end

    it "can get a single instance of invoice by UNIT_PRICE" do
      invoice_item = invoice_items(:two)
      get :show, params: { unit_price: invoice_item.unit_price }

      assert_response :success

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item["id"]).to         eq invoice_item.id
      expect(parsed_invoice_item["unit_price"]).to eq 6
      expect(parsed_invoice_item["quantity"]).to   eq 7
    end

    it "can get a single instance of invoice by CREATED_AT" do
      invoice_item = invoice_items(:two)
      get :show, params: { created_at: invoice_item.created_at }

      assert_response :success

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item["quantity"]).to eq 7
      expect(parsed_invoice_item["id"]).to       eq invoice_item.id
    end

    it "can get a single instance of invoice by UPDATED_AT" do
      invoice_item = invoice_items(:two)
      get :show, params: { updated_at: invoice_item.updated_at }

      assert_response :success

      parsed_invoice_item = JSON.parse(response.body)

      expect(parsed_invoice_item["quantity"]).to eq 7
      expect(parsed_invoice_item["id"]).to       eq invoice_item.id
    end
  end
end
