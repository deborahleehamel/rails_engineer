require 'rails_helper'

RSpec.describe Api::V1::MerchantsController do
  fixtures :merchants
  describe "GET index" do
    it "can get all instances of merchant" do
      get :index
      assert_response :success

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 3
    end
  end
end
