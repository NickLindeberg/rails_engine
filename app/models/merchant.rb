class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.top_rev_merchants(x = 3)
    Merchant.select("merchants.*, SUM(unit_price * quantity) AS rev")
            .joins(:invoice_items)
            .group(:id)
            .order("rev DESC")
            .limit(x)
  end

  # def self.top_item_merchants(x)
  #   Merchant.select("merchants.*, SUM(:invoice_items.quantity) AS total_items:")
  #           .joins(:invoices: [:invoice_items, :transactions])
  #           .where(transaction: {result: "success"})
  #           .group(:id)
  #           .order("total_items DESC")
  #           .limit(x)
  # end
end
