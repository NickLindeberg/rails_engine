require 'rails_helper'

describe 'Merchants API' do
  it 'finds one merchant by id' do
    mid = create(:merchant).id
    get "/api/v1/merchants/find?=#{mid}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(mid)
  end

  it 'finds merchant by name' do
    mname = create(:merchant).name
    get "/api/v1/merchants/find?=#{mname}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(mname)
  end
end
