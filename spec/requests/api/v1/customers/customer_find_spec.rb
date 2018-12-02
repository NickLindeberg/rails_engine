require 'rails_helper'

describe 'Customers API' do
  it 'finds customer by id' do
    cust_id = create(:customer).id
    get "/api/v1/customers/find?id=#{cust_id}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(cust_id)
  end
  it 'finds customer by first_name' do
    cust_name = create(:customer).first_name
    get "/api/v1/customers/find?=#{cust_name}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(cust_name)
  end

  it 'finds customer by last_name' do
    cust_last_name = create(:customer).last_name
    get "/api/v1/customers/find?name=#{cust_last_name}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["last_name"]).to eq(cust_last_name)
  end
  it 'finds customer by created_at' do
    cust_created = create(:customer, created_at: "2012-03-27 14:53:59 UTC").created_at

    get "/api/v1/customers/find?created_at=#{cust_created}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["created_at"]).to eq("2012-03-27T14:53:59.000Z")
  end
  it 'finds customer by updated_at' do
    cust_updated = create(:customer, updated_at: "2012-03-27 14:53:59 UTC").updated_at
    get "/api/v1/customers/find?updated_at=#{cust_updated}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["updated_at"]).to eq("2012-03-27T14:53:59.000Z")
  end

  it 'finds all customers by id' do
    cust_1 = create(:customer).id
    cust_2 = create(:customer).id
    cust_3 = create(:customer).id
    get "/api/v1/customers/find_all?id=#{cust_1}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(cust_1)
    expect(customer.last["id"]).to_not eq(cust_2)
  end

  it 'finds all customers by first_name' do
    cust_1 = create(:customer, first_name: "joe")
    cust_2 = create(:customer, first_name: "joe")
    cust_3 = create(:customer, first_name: "steve")

    get "/api/v1/customers/find_all?first_name=#{cust_1.first_name}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(cust_1.id)
    expect(customer.last["id"]).to_not eq(cust_3.id)
  end

  it 'finds all customers by last_name' do
    cust_1 = create(:customer, last_name: "jones")
    cust_2 = create(:customer, last_name: "jones")
    cust_3 = create(:customer, last_name: "stevenson")

    get "/api/v1/customers/find_all?last_name=#{cust_1.last_name}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(cust_1.id)
    expect(customer.last["id"]).to_not eq(cust_3.id)
  end

  it 'finds all customers by created_at' do
    cust_1 = create(:customer, created_at: "2012-03-27 14:53:59 UTC")
    cust_2 = create(:customer, created_at: "2012-03-27 14:53:59 UTC")
    cust_3 = create(:customer, created_at: Time.now)

    get "/api/v1/customers/find_all?created_at=#{cust_1.created_at}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(cust_1.id)
    expect(customer.last["id"]).to_not eq(cust_3.id)
  end

  it 'finds all customers by updated_at' do
    cust_1 = create(:customer, updated_at: "2012-03-27 14:53:59 UTC")
    cust_2 = create(:customer, updated_at: "2012-03-27 14:53:59 UTC")
    cust_3 = create(:customer, updated_at: Time.now)

    get "/api/v1/customers/find_all?updated_at=#{cust_1.updated_at}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(cust_1.id)
    expect(customer.last["id"]).to_not eq(cust_3.id)
  end
end
