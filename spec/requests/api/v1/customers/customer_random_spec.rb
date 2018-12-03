require 'rails_helper'

describe 'Customers API' do
  it 'finds random customer' do
    cust_id = create(:customer).id
    get "/api/v1/customers/random.json"
    expect(response).to be_successful
  end
end
