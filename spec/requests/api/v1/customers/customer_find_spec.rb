require 'rails_helper'

describe 'Customers API' do
  it 'finds customer by id' do
    cust_id = create(:customer).id
    get "/api/v1/customers/find?=#{cust_id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(cust_id)
  end

  
end
