class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def self.items_by_invoice(voice_id)
    joins(:invoices, :invoice_items)
    .where("invoices.id = #{voice_id}")
    .group(:id)
  end
end
