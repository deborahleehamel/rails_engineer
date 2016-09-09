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
    .joins(:transactions)
    .where(transactions: { result: "success" })
    .select("invoices.created_at")
    .group("invoices.created_at")
    .order("sum(invoice_items.quantity) DESC")
    .first[:created_at]
  end

  def self.most_items(quantity)
    successful_invoices
    .select("items.id, name, COUNT(invoice_items.quantity) AS items_sold")
    .group("id")
    .order("items_sold DESC")
    .limit(quantity)
  end

  def self.most_revenue(quantity)
    successful_invoices
    .select("items.id, name, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .group("id")
    .order("revenue DESC")
    .limit(quantity)
  end

  private
    def self.successful_invoices
      joins(invoices: [:invoice_items, :transactions])
      .where("transactions.result = 'success'")
    end
end
