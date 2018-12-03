require 'rails_helper'

describe 'Invoice API' do
  it 'finds random invoice' do
    cust_id = create(:invoice).id
    get "/api/v1/invoices/random.json"
    expect(response).to be_successful
  end
end
