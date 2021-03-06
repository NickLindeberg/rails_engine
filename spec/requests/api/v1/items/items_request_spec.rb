require 'rails_helper'

describe 'Items API' do
  it 'sends a list of items' do
    create_list(:item, 3)

    get '/api/v1/items.json'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(3)
  end
end
