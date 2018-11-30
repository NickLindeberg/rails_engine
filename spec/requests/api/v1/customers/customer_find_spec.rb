require 'rails_helper'

describe 'Customers API' do
  it 'finds customer by id' do
    cust_id = create(:customer).id
    get "/api/v1/customers/find?=#{cust_id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(cust_id)
  end
  it 'finds customer by name' do
    cust_name = create(:customer).first_name
    get "/api/v1/customers/find?=#{cust_name}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(cust_name)
  end

end
