class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices
  has_many :merchants,    through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    merchants.all_successful_invoices
    .group("merchants.id")
    .select("merchants.id, merchants.name, COUNT(transactions.id) AS trans_amount")
    .order("trans_amount DESC")
    .first
  end
end
