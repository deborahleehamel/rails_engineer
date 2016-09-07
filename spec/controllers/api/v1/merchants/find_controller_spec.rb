require "rails_helper"

RSpec.describe Api::V1::Merchants::FindController do
  fixtures :merchants
  describe "GET index//Multi-Finders" do
    it "can get all instances of merchant by ID" do
      merchant =  merchants(:two)
      get :index, params: { id: merchant.id }

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to         eq 1
      expect(parsed_merchants.first["name"]).to eq "Programmers R Us"
    end

    it "can get all instances of merchant by name" do
      merchant = merchants(:three)
      get :index, params: { name: merchant.name }

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to         eq 2
      expect(parsed_merchants.first["name"]).to eq "Matel"
    end

    it "can get all instances of merchant by created_at" do
      merchant = merchants(:two)
      get :index, params: { created_at: merchant.created_at }

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 2
      expect(parsed_merchants.first["name"]).to  eq "Programmers R Us"
      expect(parsed_merchants.second["name"]).to eq "Programmers R Us 2"
    end

    it "can get all instances of merchant by updated_at" do
      merchant = merchants(:one)
      get :index, params: { updated_at: merchant.updated_at }

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to         eq 3
      expect(parsed_merchants.first["name"]).to eq "Evil Corp"
      expect(parsed_merchants.last["name"]).to  eq "Matel"
    end
  end

  describe "GET show//Single Finders" do
    it "can get a single instance of merchant by ID" do
      merchant =  merchants(:two)
      get :show, params: { id: merchant.id }

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant["name"]).to eq "Programmers R Us"
      expect(parsed_merchant["id"]).to   eq 3
      expect(parsed_merchant["id"]).to   eq merchant.id
    end

    it "can get a single instance of merchant by NAME" do
      merchant =  merchants(:three)
      get :show, params: { name: merchant.name }

      parsed_merchant = JSON.parse(response.body)

      expect(parsed_merchant["name"]).to eq "Matel"
      expect(parsed_merchant["id"]).to   eq merchant.id
    end
  end
end
