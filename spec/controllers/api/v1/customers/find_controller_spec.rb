require "rails_helper"

RSpec.describe Api::V1::Customers::FindController do
  fixtures :customers
  describe "GET index//Multi-Finders" do
    it "can get all instances of customers by ID" do
      customer = customers(:two)
      get :index, params: { id: customer.id }

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to       eq 1
      expect(parsed_customers.first["id"]).to eq 3
      expect(parsed_customers.first["id"]).to eq customer.id

    end

    it "can get all customers by FIRST_NAME" do
      customer = customers(:two)
      get :index, params: { first_name: customer.first_name }

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to               eq 2
      expect(parsed_customers.first["first_name"]).to eq "Eloise"
      expect(parsed_customers.last["first_name"]).to  eq "Eloise"
    end

    it "can get all customers by LAST_NAME" do
      customer = customers(:two)
      get :index, params: { last_name: customer.last_name }

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to              eq 2
      expect(parsed_customers.first["last_name"]).to eq "Pepper"
      expect(parsed_customers.last["last_name"]).to  eq "Pepper"
    end

    it "can get all customers by CREATED_AT" do
      customer = customers(:two)
      get :index, params: { created_at: customer.created_at }

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to             eq 3
    end

    it "can get all customers by UPDATED_AT" do
      customer = customers(:two)
      get :index, params: { updated_at: customer.updated_at }

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to             eq 3
    end
  end

  describe "GET show//Single Finders" do
    it "can get a single instance of customer by ID" do
      customer = customers(:one)
      get :show, params: { id: customer.id }

      assert_response :success

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["id"]).to          eq customer.id
      expect(parsed_customer["first_name"]).to  eq "Charles"
    end

    it "can get a single instance of invoice by FIRST_NAME" do
      customer = customers(:one)
      get :show, params: { first_name: customer.first_name }

      assert_response :success

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["first_name"]).to eq "Charles"
      expect(parsed_customer["id"]).to         eq customer.id
    end

    it "can get a single instance of invoice by LAST_NAME" do
      customer = customers(:one)
      get :show, params: { last_name: customer.last_name }

      assert_response :success

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["last_name"]).to eq "Guy"
    end

    it "can get a single instance of invoice by CREATED_AT" do
      customer = customers(:one)
      get :show, params: { created_at: customer.created_at }

      assert_response :success

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["last_name"]).to eq "Guy"
      expect(parsed_customer["id"]).to        eq customer.id
    end

    it "can get a single instance of invoice by UPDATED_AT" do
      customer = customers(:one)
      get :show, params: { updated_at: customer.updated_at }

      assert_response :success

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["last_name"]).to eq "Guy"
      expect(parsed_customer["id"]).to        eq customer.id
    end
  end
end
