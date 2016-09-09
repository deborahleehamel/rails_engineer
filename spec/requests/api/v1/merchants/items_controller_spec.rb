require "rails_helper"

RSpec.describe "merchants item controller" do
  fixtures :merchants, :items
  describe "GET index" do
    it "can get all items for a given merchant" do
      merchant = merchants(:one)
      get "/api/v1/merchants/#{merchant.id}/items"

      assert_response :success

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to eq 2
    end
  end
end
