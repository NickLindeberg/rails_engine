require 'rails_helper'

describe 'Transaction API' do
  it 'finds random transaction' do
    cust_id = create(:transaction).id
    get "/api/v1/transactions/random.json"
    expect(response).to be_successful
  end
end
