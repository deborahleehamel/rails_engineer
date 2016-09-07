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
end
