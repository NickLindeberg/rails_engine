require 'csv'

namespace :import do
  desc "Imports data from csv file"
  task csv: :environment do
    Rake::Task["import:customers"].invoke
    Rake::Task["import:merchants"].invoke
    Rake::Task["import:invoices"].invoke
    Rake::Task["import:items"].invoke
    Rake::Task["import:invoice_items"].invoke
    Rake::Task["import:transactions"].invoke
  end


  desc "Imports customers"
  task customers: :environment do
    CSV.foreach("./db/csv/customers.csv",headers: true) do |row|
      Customer.create!(row.to_h)
    end
  end
  desc "Imports invoice_items"
  task invoice_items: :environment do
    CSV.foreach("./db/csv/invoice_items.csv",headers: true) do |row|
      InvoiceItem.create!(row.to_h)
    end
  end
  desc "Imports invoices"
  task invoices: :environment do
    CSV.foreach("./db/csv/invoices.csv",headers: true) do |row|
      Invoice.create!(row.to_h)
    end
  end
  desc "Imports items"
  task items: :environment do
    CSV.foreach("./db/csv/items.csv",headers: true) do |row|
      Item.create!(row.to_h)
    end
  end
  desc "Imports merchants"
  task merchants: :environment do
    CSV.foreach("./db/csv/merchants.csv",headers: true) do |row|
      Merchant.create!(row.to_h)
    end
  end
  desc "Imports transactions"
  task transactions: :environment do
    CSV.foreach("./db/csv/transactions.csv",headers: true) do |row|
      Transaction.create!(row.to_h)
    end
  end
end
