require "rails_helper"

RSpec.describe Api::V1::Items::FindController do
  fixtures :items
  describe "GET show" do
    it "can get a single item based on search" do
      item = items(:two)
      get :show, name: item.name

      assert_response :success

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["id"]).to eq item.id
      expect(parsed_item["name"]).to eq item.name
      expect(parsed_item["description"]).to eq item.description
      expect(parsed_item["unit_price"]).to eq item.unit_price
      expect(parsed_item["merchant_id"]).to eq item.merchant_id
    end
  end
end
