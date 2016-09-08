require "rails_helper"

RSpec.describe Api::V1::Items::FindController do
  fixtures :items
  describe "GET index//Multi-Finders" do
    it "can get all instances of items by ID" do
      item = items(:one)
      get :index, params: { id: item.id }

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to         eq 1
      expect(parsed_items.first["name"]).to eq "M&Ms"
    end

    it "can get all instances of items by NAME" do
      item = items(:one)
      get :index, params: { name: item.name }

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to       eq 2
      expect(parsed_items.first["name"]).to eq "M&Ms"
      expect(parsed_items.last["name"]).to  eq "M&Ms"
    end

    it "can get all instances of items by DESCRIPTION" do
      item = items(:one)
      get :index, params: { description: item.description }

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to       eq 1
      expect(parsed_items.first["description"]).to eq "stuffed with peanuts, simply delicious"
    end

    it "can get all instances of items by DESCRIPTION" do
      item = items(:one)
      get :index, params: { description: item.description }

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to       eq 1
      expect(parsed_items.first["description"]).to eq "stuffed with peanuts, simply delicious"
    end

    it "can get all instances of items by UNIT_PRICE" do
      item = items(:one)
      get :index, params: { unit_price: item.unit_price }

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to       eq 2
      expect(parsed_items.first["unit_price"]).to eq 5
      expect(parsed_items.last["unit_price"]).to  eq 5
    end

    it "can get all instances of items by MERCHANT_ID" do
      item = items(:one)
      get :index, params: { merchant_id: item.merchant_id }

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to       eq 2
      expect(parsed_items.first["merchant_id"]).to eq 980190962
      expect(parsed_items.last["merchant_id"]).to  eq 980190962
    end
  end

  describe "GET show//Single Finders" do
    it "can get a single instance of item by attributes" do
      item = items(:two)
      get :show, params: { id: item.id }

      assert_response :success

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["id"]).to          eq item.id
      expect(parsed_item["name"]).to        eq item.name
      expect(parsed_item["description"]).to eq item.description
      expect(parsed_item["unit_price"]).to  eq item.unit_price
      expect(parsed_item["merchant_id"]).to eq item.merchant_id
    end
  end
end
