class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :items
  has_many :customers, through: :invoices
end
