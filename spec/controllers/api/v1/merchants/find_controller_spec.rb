require "rails_helper"

RSpec.describe Api::V1::Merchants::FindController do
  fixtures :merchants
  describe "GET index" do
    it "can get all merchants searched for" do
      merchant = merchants(:three)
      get :index, name: merchant.name

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 2
      expect(parsed_merchants.first["name"]).to eq "Matel"
    end
  end
end
