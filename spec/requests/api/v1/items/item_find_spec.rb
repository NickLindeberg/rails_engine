require 'rails_helper'

describe 'Item API' do
  it 'finds Item by id' do
    item_1 = create(:item)
    item_2 = create(:item)
    get "/api/v1/items/find?id=#{item_1.id}"
    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_1.id)
    expect(item["id"]).to_not eq(item_2.id)
  end

  it 'finds Item by name' do
    item_1 = create(:item, name: "Cool thing")
    item_2 = create(:item, name: "dumb thing")
    get "/api/v1/items/find?name=#{item_1.name}"
    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_1.id)
    expect(item["id"]).to_not eq(item_2.id)
  end

  it 'finds Item by description' do
    item_1 = create(:item, description: "Rad!")
    item_2 = create(:item, description: "Broken")
    get "/api/v1/items/find?description=#{item_1.description}"
    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_1.id)
    expect(item["id"]).to_not eq(item_2.id)
  end

  it 'finds Item by unit_price' do
    item_1 = create(:item, unit_price: 4)
    item_2 = create(:item, unit_price: 3)
    get "/api/v1/items/find?unit_price=#{item_1.unit_price}"
    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_1.id)
    expect(item["id"]).to_not eq(item_2.id)
  end

  it 'finds Item by created_at' do
    item_1 = create(:item, created_at: "2012-03-25 09:54:09 UTC")
    item_2 = create(:item, created_at: Time.now)
    get "/api/v1/items/find?created_at=#{item_1.created_at}"
    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_1.id)
    expect(item["id"]).to_not eq(item_2.id)
  end

  it 'finds Item by updated_at' do
    item_1 = create(:item, updated_at: "2012-03-25 09:54:09 UTC")
    item_2 = create(:item, updated_at: Time.now)
    get "/api/v1/items/find?updated_at=#{item_1.updated_at}"
    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_1.id)
    expect(item["id"]).to_not eq(item_2.id)
  end

  it 'finds all Items by id' do
    item_1 = create(:item)
    item_2 = create(:item)
    get "/api/v1/items/find_all?id=#{item_1.id}"
    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.first["id"]).to eq(item_1.id)
    expect(items.last["id"]).to_not eq(item_2.id)
    expect(items.count).to eq(1)
  end

  it 'finds all Items by name' do
    item_1 = create(:item, name: "Mac")
    item_2 = create(:item, name: "Mac")
    item_3 = create(:item, name: "Asus")
    get "/api/v1/items/find_all?name=#{item_1.name}"
    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.first["id"]).to eq(item_1.id)
    expect(items.last["id"]).to_not eq(item_3.id)
    expect(items.count).to eq(2)
  end

  it 'finds all Items by description' do
    item_1 = create(:item, description: "Really Mactastic")
    item_2 = create(:item, description: "Really Mactastic")
    item_3 = create(:item, description: "Windows is cool")
    get "/api/v1/items/find_all?description=#{item_1.description}"
    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.first["id"]).to eq(item_1.id)
    expect(items.last["id"]).to_not eq(item_3.id)
    expect(items.count).to eq(2)
  end

  it 'finds all Items by unit_price' do
    item_1 = create(:item, unit_price: 4)
    item_2 = create(:item, unit_price: 4)
    item_3 = create(:item, unit_price: 6)
    get "/api/v1/items/find_all?unit_price=#{item_1.unit_price}"
    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.first["id"]).to eq(item_1.id)
    expect(items.last["id"]).to_not eq(item_3.id)
    expect(items.count).to eq(2)
  end

  it 'finds all Items by created_at' do
    item_1 = create(:item, created_at: "2012-03-25 09:54:09 UTC")
    item_2 = create(:item, created_at: "2012-03-25 09:54:09 UTC")
    item_3 = create(:item, created_at: Time.now)
    get "/api/v1/items/find_all?created_at=#{item_1.created_at}"
    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.first["id"]).to eq(item_1.id)
    expect(items.last["id"]).to_not eq(item_3.id)
    expect(items.count).to eq(2)
  end

  it 'finds all Items by updated_at' do
    item_1 = create(:item, updated_at: "2012-03-25 09:54:09 UTC")
    item_2 = create(:item, updated_at: "2012-03-25 09:54:09 UTC")
    item_3 = create(:item, updated_at: Time.now)
    get "/api/v1/items/find_all?updated_at=#{item_1.updated_at}"
    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.first["id"]).to eq(item_1.id)
    expect(items.last["id"]).to_not eq(item_3.id)
    expect(items.count).to eq(2)
  end
end
