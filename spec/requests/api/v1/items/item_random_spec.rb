require 'rails_helper'

describe ' Items API' do
  it 'finds random item' do
    cust_id = create(:item).id
    get "/api/v1/items/random.json"
    expect(response).to be_successful
  end
end
