require 'rails_helper'

RSpec.describe Api::V1::InvoicesController do
  fixtures :invoices
  describe "GET index" do
    it "can get all invoices" do
      get :index

      assert_response :success
      parsed_invoices = JSON.parse(response.body)
      
      expect(parsed_invoices.count).to eq 6
    end
  end
end
