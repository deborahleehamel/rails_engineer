require 'rails_helper'

RSpec.describe Api::V1::TransactionsController do
  fixtures :transactions
  describe "GET index" do
    it "can get all instances of transaction" do
      get :index
      
      assert_response :success

      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq 5
    end
  end
end
