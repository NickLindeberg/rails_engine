require 'rails_helper'

describe 'Invoice Items API' do
  it 'finds random invoice' do
    cust_id = create(:invoice_item).id
    get "/api/v1/invoice_items/random.json"
    expect(response).to be_successful
  end
end
