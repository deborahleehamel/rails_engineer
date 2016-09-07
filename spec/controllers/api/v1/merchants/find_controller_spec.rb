require "rails_helper"

RSpec.describe Api::V1::Merchants::FindController do
  fixtures :merchants
  describe "GET index" do
    it "can get all instances of merchant by ID" do
      merchant =  merchants(:two)
      get :index, params: { id: merchant.id }

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 1
      expect(parsed_merchants.first["name"]).to eq "Programmers R Us"
    end

    it "can get all instances of merchant by name" do
      merchant = merchants(:three)
      get :index, params: { name: merchant.name }

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 2
      expect(parsed_merchants.first["name"]).to eq "Matel"
    end

    it "can get all instances of merchant by created_at" do
      merchant = merchants(:two)
      get :index, params: { created_at: merchant.created_at }

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 2
      expect(parsed_merchants.first["name"]).to eq "Programmers R Us"
      expect(parsed_merchants.second["name"]).to eq "Programmers R Us 2"
    end
  end
end
