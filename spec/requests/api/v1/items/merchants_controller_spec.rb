require "rails_helper"

RSpec.describe "item's merchant controller" do
  fixtures :items, :merchants
  describe "GET index" do
    it "can get merchants assoicated to an item" do
      item = items(:one)
      merchant = merchants(:one)
      get "/api/v1/items/#{item.id}/merchant"

      assert_response :success

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant["name"]).to eq merchant.name
    end
  end
end
