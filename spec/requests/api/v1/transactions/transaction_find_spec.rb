require 'rails_helper'

describe 'Transactions API' do
  it 'finds transaction by id' do
    transaction_1 = create(:transaction)
    transaction_2 = create(:transaction)
    get "/api/v1/transactions/find?id=#{transaction_1.id}"
    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transaction_1.id)
    expect(transaction["id"]).to_not eq(transaction_2.id)
  end

  it 'finds transaction by credit_card_number' do
    transaction_1 = create(:transaction, credit_card_number: "4654405418249632")
    transaction_2 = create(:transaction, credit_card_number: "4654403418240000")
    get "/api/v1/transactions/find?credit_card_number=#{transaction_1.credit_card_number}"
    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transaction_1.id)
    expect(transaction["id"]).to_not eq(transaction_2.id)
  end

  it 'finds transaction by result' do
    transaction_1 = create(:transaction, result: "success")
    transaction_2 = create(:transaction, result: "failed")
    get "/api/v1/transactions/find?result=#{transaction_1.result}"
    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transaction_1.id)
    expect(transaction["id"]).to_not eq(transaction_2.id)
  end

  it 'finds transaction by created_at' do
    transaction_1 = create(:transaction, created_at:"2012-03-25 09:54:09 UTC")
    transaction_2 = create(:transaction, created_at: Time.now)
    get "/api/v1/transactions/find?created_at=#{transaction_1.created_at}"
    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transaction_1.id)
    expect(transaction["id"]).to_not eq(transaction_2.id)
  end

  it 'finds transaction by updated_at' do
    transaction_1 = create(:transaction, updated_at:"2012-03-25 09:54:09 UTC")
    transaction_2 = create(:transaction, updated_at: Time.now)
    get "/api/v1/transactions/find?updated_at=#{transaction_1.updated_at}"
    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transaction_1.id)
    expect(transaction["id"]).to_not eq(transaction_2.id)
  end

  it 'finds all transactions by id' do
    transaction_1 = create(:transaction)
    transaction_2 = create(:transaction)
    get "/api/v1/transactions/find_all?id=#{transaction_1.id}"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.first["id"]).to eq(transaction_1.id)
    expect(transactions.last["id"]).to_not eq(transaction_2.id)
    expect(transactions.count).to eq(1)
  end

  it 'finds all transactions by credit_card_number' do
    transaction_1 = create(:transaction, credit_card_number: "4654405418249632")
    transaction_2 = create(:transaction, credit_card_number: "4654405418249632")
    transaction_3 = create(:transaction, credit_card_number: "4654403418240000")
    get "/api/v1/transactions/find_all?credit_card_number=#{transaction_1.credit_card_number}"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.first["id"]).to eq(transaction_1.id)
    expect(transactions.last["id"]).to_not eq(transaction_3.id)
    expect(transactions.count).to eq(2)
  end
  it 'finds all transactions by result' do
    transaction_1 = create(:transaction, result: "success")
    transaction_2 = create(:transaction, result: "success")
    transaction_3 = create(:transaction, result: "denied")
    get "/api/v1/transactions/find_all?result=#{transaction_1.result}"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.first["id"]).to eq(transaction_1.id)
    expect(transactions.last["id"]).to_not eq(transaction_3.id)
    expect(transactions.count).to eq(2)
  end

  it 'finds all transactions by created_at' do
    transaction_1 = create(:transaction, created_at: "2012-03-25 09:54:09 UTC")
    transaction_2 = create(:transaction, created_at: "2012-03-25 09:54:09 UTC")
    transaction_3 = create(:transaction, created_at: Time.now)
    get "/api/v1/transactions/find_all?created_at=#{transaction_1.created_at}"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.first["id"]).to eq(transaction_1.id)
    expect(transactions.last["id"]).to_not eq(transaction_3.id)
    expect(transactions.count).to eq(2)
  end

  it 'finds all transactions by updated_at' do
    transaction_1 = create(:transaction, updated_at: "2012-03-25 09:54:09 UTC")
    transaction_2 = create(:transaction, updated_at: "2012-03-25 09:54:09 UTC")
    transaction_3 = create(:transaction, updated_at: Time.now)
    get "/api/v1/transactions/find_all?updated_at=#{transaction_1.updated_at}"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.first["id"]).to eq(transaction_1.id)
    expect(transactions.last["id"]).to_not eq(transaction_3.id)
    expect(transactions.count).to eq(2)
  end
end
