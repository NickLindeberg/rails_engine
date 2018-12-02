require 'rails_helper'

describe Item, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:unit_price)}\
  end

  describe 'Relationships' do
    it { should belong_to(:merchant)}
    it { should have_many(:invoice_items)}
  end

  describe 'Instance Methods' do
    xit '#best_day' do
      merchant = create(:merchant)

      customer = create(:customer)

      item = create(:item, merchant_id: merchant.id)

      day_1 = '2012-03-16'.to_date
      day_2 = '2012-04-17'.to_date

      invoice_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id, created_at: day_1)
      invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id, created_at: day_1)
      invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id, created_at: day_2)

      create_list(:invoice_item, 5, item_id: item.id, invoice_id: invoice_1.id)
      create_list(:invoice_item, 3, item_id: item.id, invoice_id: invoice_2.id)
      create_list(:invoice_item, 1, item_id: item.id, invoice_id: invoice_3.id)

      create(:transaction, invoice_id: invoice_1.id)
      create(:transaction, invoice_id: invoice_2.id)
      create(:transaction, invoice_id: invoice_3.id)
      create(:transaction, result: 'failed', invoice_id: invoice_3.id)

      expect(item.best_day(item.id)).to eq(day)
    end
  end
end
