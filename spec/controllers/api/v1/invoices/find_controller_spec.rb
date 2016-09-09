require "rails_helper"

RSpec.describe Api::V1::Invoices::FindController do
  fixtures :invoices
  describe "GET index//Multi-Finders" do
    it "can get all instances of invoices by ID" do
      invoice = invoices(:one)
      get :index, params: { id: invoice.id }

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to       eq 1
      expect(parsed_invoices.first["id"]).to eq 3
      expect(parsed_invoices.first["id"]).to eq invoice.id

    end

    it "can get all invoices by CUSTOMER ID" do
      invoice = invoices(:one)
      get :index, params: { customer_id: invoice.customer_id }

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to                eq 4
      expect(parsed_invoices.first["customer_id"]).to eq 980190962
      expect(parsed_invoices.last["customer_id"]).to  eq 980190962
    end

    it "can get all invoices by MERCHANT ID" do
      invoice = invoices(:one)
      get :index, params: { merchant_id: invoice.customer_id }

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 4
      expect(parsed_invoices.first["merchant_id"]).to eq 980190962
      expect(parsed_invoices.last["merchant_id"]).to  eq 980190962
    end

    it "can get all invoices by STATUS" do
      invoice = invoices(:one)
      get :index, params: { status: invoice.status }

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 2
      expect(parsed_invoices.first["status"]).to eq "shipped"
      expect(parsed_invoices.last["status"]).to  eq "shipped"
    end

    it "can get all invoices by CREATED_AT" do
      invoice = invoices(:one)
      get :index, params: { created_at: invoice.created_at }

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 2
      expect(parsed_invoices.first["status"]).to eq "shipped"
      expect(parsed_invoices.last["status"]).to  eq "shipped"
    end

    it "can get all invoices by UPDATED_AT" do
      invoice = invoices(:one)
      get :index, params: { updated_at: invoice.updated_at }

      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq 2
      expect(parsed_invoices.first["status"]).to eq "shipped"
      expect(parsed_invoices.last["status"]).to  eq "shipped"
    end
  end

  describe "GET show//Single Finders" do
    it "can get a single instance of invoice by ID" do
      invoice = invoices(:two)
      get :show, params: { id: invoice.id }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["id"]).to      eq 298486374
      expect(parsed_invoice["id"]).to      eq invoice.id
      expect(parsed_invoice["status"]).to  eq invoice.status
    end

    it "can get a single instance of invoice by CUSTOMER ID" do
      invoice = invoices(:two)
      get :show, params: { customer_id: invoice.customer_id }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["customer_id"]).to eq 298486374
    end

    it "can get a single instance of invoice by MERCHANT ID" do
      invoice = invoices(:two)
      get :show, params: { merchant_id: invoice.merchant_id }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["merchant_id"]).to eq 980190962
    end

    it "can get a single instance of invoice by STATUS" do
      invoice = invoices(:two)
      get :show, params: { status: invoice.status }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["id"]).to          eq invoice.id
      expect(parsed_invoice["status"]).to      eq invoice.status
      expect(parsed_invoice["customer_id"]).to eq invoice.customer_id
      expect(parsed_invoice["merchant_id"]).to eq invoice.merchant_id
    end

    it "can get a single instance of invoice by CREATED_AT" do
      invoice = invoices(:two)
      get :show, params: { created_at: invoice.created_at }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["status"]).to eq "pending"
      expect(parsed_invoice["id"]).to     eq invoice.id
    end

    it "can get a single instance of invoice by UPDATED_AT" do
      invoice = invoices(:two)
      get :show, params: { updated_at: invoice.updated_at }

      assert_response :success

      parsed_invoice = JSON.parse(response.body)

      expect(parsed_invoice["status"]).to eq "pending"
      expect(parsed_invoice["id"]).to     eq invoice.id
    end
  end
end
