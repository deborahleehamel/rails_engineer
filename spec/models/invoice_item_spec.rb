require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:unit_price) }
    it { is_expected.to validate_presence_of(:item_id) }
    it { is_expected.to validate_presence_of(:invoice_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:invoice) }
  end

end
