require "rails_helper"

RSpec.describe Api::V1::Transactions::FindController do
  fixtures :transactions
  describe "GET show//Single Finders" do
    it "can get a single instance of transaction by ID" do
      transaction =  transactions(:two)
      get :show, params: { id: transaction.id }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["name"]).to eq "Programmers R Us"
      expect(parsed_transaction["id"]).to   eq 3
      expect(parsed_transaction["id"]).to   eq transaction.id
    end

    it "can get a single instance of transaction by INVOICE_ID" do
      transaction =  transactions(:three)
      get :show, params: { invoice_id: transaction.invoice_id }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["invoice_id"]).to eq ""
      expect(parsed_transaction["id"]).to   eq transaction.id
    end

    it "can get a single instance of transaction by CC Number" do
      transaction =  transactions(:three)
      get :show, params: { name: transaction.name }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["name"]).to eq "Matel"
      expect(parsed_transaction["id"]).to   eq transaction.id
    end

    it "can get a single instance of transaction by CREATED_AT" do
      transaction =  transactions(:two)
      get :show, params: { created_at: transaction.created_at }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["name"]).to eq "Programmers R Us"
      expect(parsed_transaction["id"]).to   eq transaction.id
    end

    it "can get a single instance of transaction by UPDATED_AT" do
      transaction =  transactions(:two)
      get :show, params: { updated_at: transaction.updated_at }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["name"]).to eq "Programmers R Us"
      expect(parsed_transaction["id"]).to   eq transaction.id
    end
  end
end
