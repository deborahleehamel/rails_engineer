require 'rails_helper'

RSpec.describe "merchants controller" do
  fixtures :merchants
  describe "GET index" do
    it "can get all instances of merchant" do
      get "/api/v1/merchants"
      assert_response :success

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 5
    end
  end

  describe "GET show" do
    it "can get single instance of merchant" do
      merchant = merchants(:one)
      get "/api/v1/merchants/#{merchant.id}"

      assert_response :success

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant["name"]).to eq "Evil Corp"
    end
  end
end
