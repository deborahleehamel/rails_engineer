FactoryGirl.define do
  factory :transaction do
    credit_card_number "MyString"
    credit_card_expiration_date "2016-09-06 00:32:17"
    result "MyString"
    invoice nil
  end
end
