require "load_csv"

namespace :all_data do
  desc "loads data from all of the csvs"
  task import: :environment do
    puts "Importing all data..."

    data = {
      "customers"     => Customer,
      "merchants"     => Merchant,
      "items"         => Item,
      "invoices"      => Invoice,
      "transactions"  => Transaction,
      "invoice_items" => InvoiceItem
    }

    data.each do |file_name, model|
      LoadCsv.new(file_name, model)
    end

    puts "All data successfully imported."
  end
end
