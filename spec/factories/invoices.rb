FactoryGirl.define do
  factory :invoice do
    status "Shipped"
    merchant "Test Merchant"
    customer "Test Customer"
  end
end
