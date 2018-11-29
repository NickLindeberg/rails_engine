class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.top_rev_merchants
    select("merchants.*, SUM(unit_price * quantity) AS rev")
    .joins(:invoice_items)
    .group(:id)
    .order("rev DESC")
    .limit(3)
  end
end
