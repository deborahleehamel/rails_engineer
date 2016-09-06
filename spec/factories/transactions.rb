FactoryGirl.define do
  factory :transaction do
    credit_card_number "424242424242"
    credit_card_expiration_date "2016-09-06 00:32:17"
    result "Success"
    invoice "Test Invoice"
  end
end
