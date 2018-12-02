require 'rails_helper'

describe 'Invoice API' do
  it 'finds Invoice by id' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    get "/api/v1/invoices/find?id=#{invoice_1.id}"
    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["id"]).to_not eq(invoice_2.id)
  end

  it 'finds Invoice by status' do
    invoice_1 = create(:invoice, status: "shipped")
    invoice_2 = create(:invoice, status: "pending")
    get "/api/v1/invoices/find?status=#{invoice_1.status}"
    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["id"]).to_not eq(invoice_2.id)
  end

  it 'finds Invoice by created_at' do
    invoice_1 = create(:invoice, created_at: "2012-03-25 09:54:09 UTC")
    invoice_2 = create(:invoice, created_at: Time.now)
    get "/api/v1/invoices/find?created_at=#{invoice_1.created_at}"
    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["id"]).to_not eq(invoice_2.id)
  end

  it 'finds Invoice by updated_at' do
    invoice_1 = create(:invoice, updated_at: "2012-03-25 09:54:09 UTC")
    invoice_2 = create(:invoice, updated_at: Time.now)
    get "/api/v1/invoices/find?updated_at=#{invoice_1.updated_at}"
    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["id"]).to_not eq(invoice_2.id)
  end

  it 'finds all Invoices by id' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    get "/api/v1/invoices/find_all?id=#{invoice_1.id}"
    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.first["id"]).to eq(invoice_1.id)
    expect(invoices.last["id"]).to_not eq(invoice_2.id)
    expect(invoices.count).to eq(1)
  end

  it 'finds all Invoices by status' do
    invoice_1 = create(:invoice, status: "shipped")
    invoice_2 = create(:invoice, status: "shipped")
    invoice_3 = create(:invoice, status: "pending")
    get "/api/v1/invoices/find_all?status=#{invoice_1.status}"
    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.first["id"]).to eq(invoice_1.id)
    expect(invoices.last["id"]).to_not eq(invoice_3.id)
    expect(invoices.count).to eq(2)
  end

  it 'finds all Invoices by created_at' do
    invoice_1 = create(:invoice, created_at: "2012-03-25 09:54:09 UTC")
    invoice_2 = create(:invoice, created_at: "2012-03-25 09:54:09 UTC")
    invoice_3 = create(:invoice, created_at: Time.now)
    get "/api/v1/invoices/find_all?created_at=#{invoice_1.created_at}"
    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.first["id"]).to eq(invoice_1.id)
    expect(invoices.last["id"]).to_not eq(invoice_3.id)
    expect(invoices.count).to eq(2)
  end

  it 'finds all Invoices by updated_at' do
    invoice_1 = create(:invoice, updated_at: "2012-03-25 09:54:09 UTC")
    invoice_2 = create(:invoice, updated_at: "2012-03-25 09:54:09 UTC")
    invoice_3 = create(:invoice, updated_at: Time.now)
    get "/api/v1/invoices/find_all?updated_at=#{invoice_1.updated_at}"
    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.first["id"]).to eq(invoice_1.id)
    expect(invoices.last["id"]).to_not eq(invoice_3.id)
    expect(invoices.count).to eq(2)
  end
end
