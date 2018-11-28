require 'csv'

namespace :import do
  desc "Imports data from csv file"
  task csv: :environment do
    Rake::Task["import:merchants"].invoke
  end


  desc "Imports merchants"
  task merchants: :environment do
    CSV.foreach("./db/csv/merchants.csv",headers: true) do |row|
      Merchant.create!(row.to_h)
    end
  end
end
