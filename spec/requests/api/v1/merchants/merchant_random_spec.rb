require 'rails_helper'

describe 'Merchant API' do
  it 'finds random merchant' do
    cust_id = create(:merchant).id
    get "/api/v1/merchants/random.json"
    expect(response).to be_successful
  end
end
