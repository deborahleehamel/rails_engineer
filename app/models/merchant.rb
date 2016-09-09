class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions,  through: :invoices
  has_many :customers,     through: :invoices

  def revenue
    (
    successful_invoices
    .sum("invoice_items.unit_price * invoice_items.quantity")/100.0
    )
    .to_s
  end

  def revenue_by_date(date)
    (
    successful_invoices
    .where(created_at: date)
    .sum("invoice_items.unit_price * invoice_items.quantity")/100.0
    )
    .to_s
  end

  def customers_pending_invoices
    customers
    .joins("INNER JOIN transactions ON transactions.invoice_id = invoices.id")
    .where("transactions.result = 'failed'")
    .distinct
  end

  def favorite_customer
    customers
    .joins("INNER JOIN transactions ON transactions.invoice_id = invoices.id")
    .where('transactions.result = ?','success')
    .group('id').order('count(transactions) DESC')
    .first
  end

  def self.most_items(quantity)
     all_successful_invoices
    .group("merchants.id")
    .order("SUM(invoice_items.quantity) DESC")
    .limit(quantity)
  end

  def self.total_revenue(date)
    (
    all_successful_invoices
    .where(invoices: {created_at: date})
    .sum("invoice_items.unit_price * invoice_items.quantity")/100.0
    )
    .to_s
  end

  def self.most_revenue(quantity)
    all_successful_invoices
    joins(:invoice_items)
    .group(:id)
    .order("SUM(invoice_items.unit_price * invoice_items.quantity) DESC")
    .limit(quantity)
  end

  private
    def self.all_successful_invoices
      joins(invoices:[:transactions, :invoice_items])
      .where("transactions.result = 'success'")
    end

    def successful_invoices
      invoices
      .joins(:transactions, :invoice_items)
      .where("transactions.result = 'success'")
    end
end
