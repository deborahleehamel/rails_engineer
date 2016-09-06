require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:unit_price) }
    it { is_expected.to validate_presence_of(:merchant_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:merchant) }
  end
  
end
