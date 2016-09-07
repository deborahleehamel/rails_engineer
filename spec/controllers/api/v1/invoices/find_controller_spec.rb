require "rails_helper"

RSpec.describe Api::V1::Invoices::FindController do
  fixtures :invoices
  describe "GET index" do
    it "can get all invoices searched for" do
      invoice = invoices(:one)
      get :index, status: invoice.status

      assert_response :success

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 2
      expect(parsed_invoices.first.has_key?("status")).to be true
    end
  end


end
