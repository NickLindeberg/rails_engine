require 'rails_helper'

describe 'InvoiceItems API' do
  it 'sends a list of Invoice Items' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items.json'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items["data"].count).to eq(3)
  end
end
