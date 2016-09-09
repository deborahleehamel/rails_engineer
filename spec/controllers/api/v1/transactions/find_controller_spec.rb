require "rails_helper"

RSpec.describe Api::V1::Transactions::FindController do
  fixtures :transactions
  describe "GET show//Single Finders" do
    it "can get a single instance of transaction by ID" do
      transaction =  transactions(:two)
      get :show, params: { id: transaction.id }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["id"]).to   eq 298486374
      expect(parsed_transaction["id"]).to   eq transaction.id
    end

    it "can get a single instance of transaction by INVOICE_ID" do
      transaction =  transactions(:four)
      get :show, params: { invoice_id: transaction.invoice_id }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["invoice_id"]).to eq 113629430
      expect(parsed_transaction["id"]).to         eq transaction.id
    end

    it "can get a single instance of transaction by CC Number" do
      transaction =  transactions(:one)
      get :show, params: { credit_card_number: transaction.credit_card_number }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["credit_card_number"]).to eq "12345"
      expect(parsed_transaction["id"]).to                 eq transaction.id
    end

    it "can get a single instance of transaction by RESULT" do
      transaction =  transactions(:two)
      get :show, params: { result: transaction.result }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["result"]).to eq "failed"
      expect(parsed_transaction["id"]).to     eq transaction.id
    end

    it "can get a single instance of transaction by CREATED_AT" do
      transaction =  transactions(:three)
      get :show, params: { created_at: transaction.created_at }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["id"]).to   eq transaction.id
    end

    it "can get a single instance of transaction by UPDATED_AT" do
      transaction =  transactions(:two)
      get :show, params: { updated_at: transaction.updated_at }

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["id"]).to   eq transaction.id
    end
  end

  describe "GET index//Multi-Finders" do
    it "can get all instances of transaction by ID" do
      transaction =  transactions(:two)
      get :index, params: { id: transaction.id }

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to         eq 1
      expect(parsed_transactions.first["id"]).to   eq 298486374
      expect(parsed_transactions.first["id"]).to   eq transaction.id
    end

    it "can get all instances of transaction by INVOICE_ID" do
      transaction =  transactions(:one)
      get :index, params: { invoice_id: transaction.invoice_id }

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to               eq 3
      expect(parsed_transactions.first["invoice_id"]).to eq 980190962
      expect(parsed_transactions.first["id"]).to         eq transaction.id
    end

    it "can get all instances of transaction by CC Number" do
      transaction =  transactions(:two)
      get :index, params: { credit_card_number: transaction.credit_card_number }

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to                       eq 3
      expect(parsed_transactions.first["credit_card_number"]).to eq "45678"
      expect(parsed_transactions.first["id"]).to                 eq transaction.id
    end

    it "can get all instances of transaction by RESULT" do
      transaction =  transactions(:one)
      get :index, params: { result: transaction.result }

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to           eq 3
      expect(parsed_transactions.first["result"]).to eq "success"
      expect(parsed_transactions.first["id"]).to     eq transaction.id
    end

    it "can get all instances of transaction by CREATED_AT" do
      transaction =  transactions(:one)
      get :index, params: { created_at: transaction.created_at }

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to         eq 3
      expect(parsed_transactions.first["id"]).to   eq transaction.id
    end

    it "can get all instances of transaction by UPDATED_AT" do
      transaction =  transactions(:one)
      get :index, params: { updated_at: transaction.updated_at }

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to         eq 3
      expect(parsed_transactions.first["id"]).to   eq transaction.id
    end
  end
end
