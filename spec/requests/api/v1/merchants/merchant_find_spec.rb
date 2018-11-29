require 'rails_helper'

describe 'Merchants API' do
  it 'finds one merchant by id' do
    mid = create(:merchant).id
    get "/api/v1/merchants/find?=#{mid}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(mid)
  end

  it 'finds one merchant by name' do
    mname = create(:merchant).name
    get "/api/v1/merchants/find?=#{mname}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(mname)
  end

  it 'finds one merchant by created_at' do
    merc = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")
    get "/api/v1/merchants/find?=#{merc.created_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["created_at"]).to eq("2012-03-27T14:53:59.000Z")
  end

  it 'finds one merchant by updated_at' do
    merc = create(:merchant, updated_at: "2012-03-27 14:53:59 UTC")
    get "/api/v1/merchants/find?=#{merc.updated_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["updated_at"]).to eq("2012-03-27T14:53:59.000Z")
  end
end
