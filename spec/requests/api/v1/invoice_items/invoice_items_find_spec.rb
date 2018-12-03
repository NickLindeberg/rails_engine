require 'rails_helper'

describe 'Invoice_items API' do
  it 'finds Invoice_item by id' do
    ii_id = create(:invoice_item)
    ii_id_2 = create(:invoice_item)
    get "/api/v1/invoice_items/find?id=#{ii_id.id.to_s}"
    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)["data"]

    expect(invoice_item["id"]).to eq(ii_id.id.to_s)
    expect(invoice_item["id"]).to_not eq(ii_id_2.id)
  end
  it 'finds Invoice_item by quantity' do
    ii_id = create(:invoice_item, quantity: 3)
    ii_id_2 = create(:invoice_item, quantity: 4)
    get "/api/v1/invoice_items/find?quantity=#{ii_id.quantity}"
    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)["data"]

    expect(invoice_item["id"]).to eq(ii_id.id.to_s)
    expect(invoice_item["id"]).to_not eq(ii_id_2.id)
  end

  it 'finds Invoice_item by quantity' do
    ii_id = create(:invoice_item, unit_price: 3)
    ii_id_2 = create(:invoice_item, unit_price: 4)
    get "/api/v1/invoice_items/find?unit_price=#{ii_id.unit_price}"
    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)["data"]

    expect(invoice_item["id"]).to eq(ii_id.id.to_s)
    expect(invoice_item["id"]).to_not eq(ii_id_2.id)
  end

  it 'finds Invoice_item by created_at' do
    ii_id = create(:invoice_item, created_at: "2012-03-27 14:53:59 UTC")
    ii_id_2 = create(:invoice_item, created_at: Time.now)
    get "/api/v1/invoice_items/find?created_at=#{ii_id.created_at}"
    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)["data"]

    expect(invoice_item["id"]).to eq(ii_id.id.to_s)
    expect(invoice_item["id"]).to_not eq(ii_id_2.id)
  end

  it 'finds Invoice_item by updated_at' do
    ii_id = create(:invoice_item, updated_at: "2012-03-27 14:53:59 UTC")
    ii_id_2 = create(:invoice_item, updated_at: Time.now)
    get "/api/v1/invoice_items/find?updated_at=#{ii_id.updated_at}"
    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)["data"]

    expect(invoice_item["id"]).to eq(ii_id.id.to_s)
    expect(invoice_item["id"]).to_not eq(ii_id_2.id)
  end

  it 'finds_all Invoice_items by id' do
    ii_id = create(:invoice_item)
    ii_id_2 = create(:invoice_item)
    get "/api/v1/invoice_items/find_all?id=#{ii_id.id}"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)["data"]

    expect(invoice_items.first["id"]).to eq(ii_id.id.to_s)
    expect(invoice_items.last["id"]).to_not eq(ii_id_2.id)
    expect(invoice_items.count).to eq(1)
  end

  it 'finds_all Invoice_items by quantity' do
    ii_id = create(:invoice_item, quantity: 3)
    ii_id_2 = create(:invoice_item, quantity: 3)
    ii_id_3 = create(:invoice_item, quantity: 4)
    get "/api/v1/invoice_items/find_all?quantity=#{ii_id.quantity}"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)["data"]

    expect(invoice_items.first["id"]).to eq(ii_id.id.to_s)
    expect(invoice_items[1]["id"]).to eq(ii_id_2.id.to_s)
    expect(invoice_items.last["id"]).to_not eq(ii_id_3.id)
    expect(invoice_items.count).to eq(2)
  end

  it 'finds_all Invoice_items by unit_price' do
    ii_id = create(:invoice_item, unit_price: 3)
    ii_id_2 = create(:invoice_item, unit_price: 3)
    ii_id_3 = create(:invoice_item, unit_price: 4)
    get "/api/v1/invoice_items/find_all?unit_price=#{ii_id.unit_price}"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)["data"]

    expect(invoice_items.first["id"]).to eq(ii_id.id.to_s)
    expect(invoice_items[1]["id"]).to eq(ii_id_2.id.to_s)
    expect(invoice_items.last["id"]).to_not eq(ii_id_3.id)
    expect(invoice_items.count).to eq(2)
  end

  it 'finds_all Invoice_items by created_at' do
    ii_id = create(:invoice_item, created_at: "2012-03-27 14:53:59 UTC")
    ii_id_2 = create(:invoice_item, created_at: "2012-03-27 14:53:59 UTC")
    ii_id_3 = create(:invoice_item, created_at: Time.now)
    get "/api/v1/invoice_items/find_all?created_at=#{ii_id.created_at}"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)["data"]

    expect(invoice_items.first["id"]).to eq(ii_id.id.to_s)
    expect(invoice_items[1]["id"]).to eq(ii_id_2.id.to_s)
    expect(invoice_items.last["id"]).to_not eq(ii_id_3.id)
    expect(invoice_items.count).to eq(2)
  end

  it 'finds_all Invoice_items by updated_at' do
    ii_id = create(:invoice_item, updated_at: "2012-03-27 14:53:59 UTC")
    ii_id_2 = create(:invoice_item, updated_at: "2012-03-27 14:53:59 UTC")
    ii_id_3 = create(:invoice_item, updated_at: Time.now)
    get "/api/v1/invoice_items/find_all?updated_at=#{ii_id.updated_at}"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)["data"]

    expect(invoice_items.first["id"]).to eq(ii_id.id.to_s)
    expect(invoice_items[1]["id"]).to eq(ii_id_2.id.to_s)
    expect(invoice_items.last["id"]).to_not eq(ii_id_3.id)
    expect(invoice_items.count).to eq(2)
  end
end
