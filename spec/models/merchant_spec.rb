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
      merchant_1 = create(:merchant, name: "One")
      merchant_2 = create(:merchant, name: "Two")
      merchant_3 = create(:merchant, name: "Three")
      merchant_4 = create(:merchant, name: "Four")

      item_1 = create(:item, merchant_id: merchant_1.id)
      item_2 = create(:item, merchant_id: merchant_2.id)
      item_3 = create(:item, merchant_id: merchant_3.id)

      customer = create(:customer)
      invoice_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant_1.id)
      invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id)
      invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant_3.id)

      create_list(:invoice_item, 5, item_id: item_1.id, invoice_id: invoice_1.id, unit_price: 50, quantity: 3)
      create_list(:invoice_item, 5, item_id: item_2.id, invoice_id: invoice_2.id, unit_price: 50, quantity: 2)
      create_list(:invoice_item, 5, item_id: item_3.id, invoice_id: invoice_3.id, unit_price: 50, quantity: 1)

      create(:transaction, invoice_id: invoice_1.id)
      create(:transaction, invoice_id: invoice_2.id)
      create(:transaction, invoice_id: invoice_3.id)

      sorted_merchants = Merchant.top_rev_merchants(3)

      expect(sorted_merchants).to eq([merchant_1, merchant_2, merchant_3])
    end
  end
end
