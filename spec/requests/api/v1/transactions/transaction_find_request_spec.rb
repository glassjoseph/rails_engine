require 'rails_helper'

RSpec.describe "Tranaction find API" do

  it "can find transaction by id" do
    db_transaction = create(:transaction, id: 899)
    get "/api/v1/transactions/find?id=899"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction['id']).to eq(899)
    expect(transaction['id']).to eq(db_transaction.id)
    expect(transaction['credit_card_number']).to eq(db_transaction.credit_card_number)
  end

  it "can find transaction by invoice_id" do
    create(:invoice, id: 1)
    db_transaction = create(:transaction, invoice_id: 1)
    get "/api/v1/transactions/find?invoice_id=1"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction['invoice_id']).to eq(1)
    expect(transaction['id']).to eq(db_transaction.id)
  end

  it "can find transaction by credit_card_number" do

    db_transaction = create(:transaction, credit_card_number: "12345678")
    get "/api/v1/transactions/find?credit_card_number=12345678"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction['id']).to eq(db_transaction.id)
    expect(transaction['credit_card_number']).to eq(db_transaction.credit_card_number)
  end

  it "can find transaction by result" do

    db_transaction = create(:transaction, result: "success")
    get "/api/v1/transactions/find?result=success"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction['id']).to eq(db_transaction.id)
    expect(transaction['credit_card_number']).to eq(db_transaction.credit_card_number)
  end

  it "can find all transactions with find_all" do

    create(:invoice, id: 1)
    create(:invoice, id: 5)
    db_transaction = create(:transaction, invoice_id: 1)
    create(:transaction, invoice_id: 1)
    create(:transaction, invoice_id: 1)
    not_found = create(:transaction, invoice_id: 5)

    get "/api/v1/transactions/find_all?invoice_id=1"
    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transactions.first['id']).to eq(db_transaction.id)
  end


  it "can find transaction by created_at" do
    db_transaction = create(:transaction, created_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/transactions/find?created_at='2012-03-27T14:56:04.000Z'"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction['id']).to eq(db_transaction.id)
  end

  it "can find transaction by updated_at" do
    db_transaction = create(:transaction, updated_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/transactions/find?updated_at='2012-03-27T14:56:04.000Z'"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction['id']).to eq(db_transaction.id)
  end

end
