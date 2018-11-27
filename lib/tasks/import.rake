require 'csv'

namespace :import do
  desc "Imports data from csv file"
  task :data => :environment do
    Rake::Task["import:merchants"].invoke
  end


  desc "Imports merchants"
  task merchants: :environment do
    size = CSV.read("./db/csv/merchants.csv") do |row|
      Merchant.create(:row.to_h)
    end
  end
end
