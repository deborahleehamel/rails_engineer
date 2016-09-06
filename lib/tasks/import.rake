require "csv"

namespace :csv do
  desc "import all files"
  task import_all: [
    :import_customers,
    :import_merchants,
    :import_invoices,
    :import_transactions,
    :import_items,
    :import_invoice_items
  ]

  desc "Import Customer csv"
  task import_customers: :environment do
    puts "Importing Customers"
    file = "db/data/customers.csv"

    CSV.foreach( file, headers: true ) do |row|
      Customer.create(row.to_h)
    end
    puts "Customers Successfully Imported"
  end

  desc "Import Invoice Items csv"
  task import_invoice_items: :environment do
    puts "Importing Invoice Items"
    file = "db/data/invoice_items.csv"

    CSV.foreach( file, headers: true ) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      InvoiceItem.create(row.to_h)
    end
    puts "Invoice Items Successfully Imported"
  end

  desc "Import Invoices csv"
  task import_invoices: :environment do
    puts "Importing Invoices"
    file = "db/data/invoices.csv"

    CSV.foreach( file, headers: true ) do |row|
      Invoice.create(row.to_h)
    end
    puts "Invoices Successfully Imported"
  end

  desc "Import Items csv"
  task import_items: :environment do
    puts "Importing Items"
    file = "db/data/items.csv"

    CSV.foreach( file, headers: true ) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      Item.create(row.to_h)
    end
    puts "Items Successfully Imported"
  end

  desc "Import Merchants csv"
  task import_merchants: :environment do
    puts "Importing Merchants"
    file = "db/data/merchants.csv"

    CSV.foreach( file, headers: true ) do |row|
      Merchant.create(row.to_h)
    end
    puts "Merchants Successfully Imported"
  end

  desc "Import Transactions csv"
  task import_transactions: :environment do
    puts "Importing Transactions"
    file = "db/data/transactions.csv"

    CSV.foreach( file, headers: true ) do |row|
      Transaction.create(row.to_h)
    end
    puts "Transactions Successfully Imported"
  end

end
