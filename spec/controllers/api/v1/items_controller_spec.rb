RSpec.describe Api::V1::ItemsController do
  fixtures :items
  describe "GET index" do
    it "can get all items" do
      get :index

      assert_response :success

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to eq 3
    end
  end

  describe "GET show" do
    it "can get a single item" do
      item = items(:one)
      get :show, id: item.id

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
