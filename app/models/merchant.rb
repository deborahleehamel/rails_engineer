class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions,  through: :invoices
  has_many :customers,     through: :invoices

  def revenue
    (invoices
    .joins(:transactions, :invoice_items)
    .where("transactions.result = 'success'")
    .sum("invoice_items.unit_price * invoice_items.quantity")/100.0)
    .to_s
  end
end
