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

  xit 'finds all merchants by name' do
    m_1 = create(:merchant, name: "joe")
    m_2 = create(:merchant, name: "joe")
    m_3 = create(:merchant, name: "joe")
    m_4 = create(:merchant, name: "koe", created_at: Time.now, updated_at: Time.now)

    get "/api/v1/merchants/find_all?=#{m_1.name}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.first["id"]).to eq(m_1.id)
    expect(merchants[1]["id"]).to eq(m_2.id)
    expect(merchants[2]["id"]).to eq(m_3.id)
    expect(merchants.length).to eq(3)
  end

  it 'finds all merchants by id' do
    m_1 = create(:merchant)
    m_2 = create(:merchant)

    get "/api/v1/merchants/find_all?=#{m_1.id}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.first["id"]).to eq(m_1.id)
    expect(merchants.last["id"]).to_not eq(m_1.id)
  end

  it 'finds all merchants by created_at' do
    m_1 = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")
    m_2 = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find_all?=#{m_1.created_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.first["id"]).to eq(m_1.id)
    expect(merchants.last["id"]).to eq(m_2.id)
  end
  it 'finds all merchants by updated_at' do
    m_1 = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")
    m_2 = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find_all?=#{m_1.updated_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.first["id"]).to eq(m_1.id)
    expect(merchants.last["id"]).to eq(m_2.id)
    expect(merchants.length).to eq(2)
  end
end
