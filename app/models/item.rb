class Item < ApplicationRecord
  validates :name,        presence: true
  validates :description, presence: true
  validates :unit_price,  presence: true
  validates :merchant_id, presence: true

  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices,     through: :invoice_items
  has_many   :transactions, through: :invoice_items

  def best_day
    invoices
    .joins(:transactions).where(transactions: { result: "success" })
    .select("invoices.created_at")
    .group("invoices.created_at")
    .order("sum(invoice_items.quantity) DESC").first
  end
end
