require 'rails_helper'

RSpec.describe Api::V1::TransactionsController do
  fixtures :transactions
  describe "GET index" do
    it "can get all instances of transaction" do
      get :index

      assert_response :success

      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to eq 4
    end
  end

  describe "GET show" do
    it "can get single instance of transaction" do
      transaction = transactions(:one)
      get :show, params: { id: transaction.id }

      assert_response :success

      parsed_transaction = JSON.parse(response.body)

      expect(parsed_transaction["credit_card_number"]).to eq "12345"
      expect(parsed_transaction["id"]).to                 eq 2
    end
  end
end
