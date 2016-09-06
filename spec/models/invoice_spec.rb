require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:customer_id) }
    it { is_expected.to validate_presence_of(:merchant_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:merchant) }
  end
end
