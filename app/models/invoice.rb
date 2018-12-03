class Invoice < ApplicationRecord
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.best_day(item_id)
    Invoice.select("invoices.created_at, sum(invoice_items.quantity) AS best_day")
           .joins(:invoice_items)
           .where("invoice_items.item_id = item_id")
           .group("invoices.id")
           .order("best_day desc, invoices.created_at desc")
           .limit(1)
           .first
  end


end
