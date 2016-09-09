require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:credit_card_number) }
    it { is_expected.to validate_presence_of(:result) }
    it { is_expected.to validate_presence_of(:invoice_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:invoice) }
  end
  
end
