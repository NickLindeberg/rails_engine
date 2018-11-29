require 'rails_helper'

describe Merchant, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
  end
  describe 'Relationships' do
    it { should have_many(:items)}
    it { should have_many(:invoices)}
    it { should have_many(:invoice_items).through(:invoices)}
  end

  describe 'class methods' do
    it 'top_rev_merchants' do
      merchant_1 = Merchant.create(name: "One")
      merchant_2 = Merchant.create(name: "Two")
      merchant_3 = Merchant.create(name: "Three")
      merchant_4 = Merchant.create(name: "Four")
      invoice_item_1 = merchant_1.invoice_items.create(quantity: 4, unit_price: 10)
      invoice_item_2 = merchant_2.invoice_items.create(quantity: 1, unit_price: 20)
      invoice_item_3 = merchant_3.invoice_items.create(quantity: 1, unit_price: 50)
      invoice_item_4 = merchant_4.invoice_items.create(quantity: 2, unit_price: 5)

      sorted_merchants = Merchant.top_rev_merchants

      expect(sorted_merchants).to eq([merchant_3, merchant_1, merchant_2])
    end
  end
end
