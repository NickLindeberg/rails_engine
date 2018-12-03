require 'rails_helper'

describe 'Merchants API' do
  it 'finds one merchant by id' do
    mid = create(:merchant).id
    get "/api/v1/merchants/find?id=#{mid}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["id"]).to eq(mid.to_s)
  end

  it 'finds one merchant by name' do
    mname = create(:merchant)
    get "/api/v1/merchants/find?name=#{mname.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["id"]).to eq(mname.id.to_s)
  end

  it 'finds one merchant by created_at' do
    merc = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")
    get "/api/v1/merchants/find?created_at=#{merc.created_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["id"]).to eq(merc.id.to_s)
  end

  it 'finds one merchant by updated_at' do
    merc = create(:merchant, updated_at: "2012-03-27 14:53:59 UTC")
    get "/api/v1/merchants/find?updated_at=#{merc.updated_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["id"]).to eq(merc.id.to_s)
  end

  it 'finds all merchants by name' do
    m_1 = create(:merchant, name: "joe")
    m_2 = create(:merchant, name: "joe")
    m_3 = create(:merchant, name: "joe")
    m_4 = create(:merchant, name: "steve")

    get "/api/v1/merchants/find_all?name=#{m_1.name}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]

    expect(merchants.first["id"]).to eq(m_1.id.to_s)
    expect(merchants[1]["id"]).to eq(m_2.id.to_s)
    expect(merchants[2]["id"]).to eq(m_3.id.to_s)
    expect(merchants.length).to eq(3)
  end

  it 'finds all merchants by id' do
    m_1 = create(:merchant)
    m_2 = create(:merchant)

    get "/api/v1/merchants/find_all?id=#{m_1.id}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]

    expect(merchants.first["id"]).to eq(m_1.id.to_s)
    expect(merchants.last["id"]).to_not eq(m_2.id.to_s)
  end

  it 'finds all merchants by created_at' do
    m_1 = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")
    m_2 = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find_all?created_at=#{m_1.created_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]

    expect(merchants.first["id"]).to eq(m_1.id.to_s)
    expect(merchants.last["id"]).to eq(m_2.id.to_s)
  end
  it 'finds all merchants by updated_at' do
    m_1 = create(:merchant, updated_at: "2012-03-27 14:53:59 UTC")
    m_2 = create(:merchant, updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find_all?updated_at=#{m_1.updated_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]

    expect(merchants.first["id"]).to eq(m_1.id.to_s)
    expect(merchants.last["id"]).to eq(m_2.id.to_s)
    expect(merchants.length).to eq(2)
  end
end
