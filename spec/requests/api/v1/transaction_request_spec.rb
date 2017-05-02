require 'rails_helper'

RSpec.describe "Transactions API" do
  it "shows all transactions" do
    create_list(:transaction, 3)

    db_transaction = Transaction.first

    get "/api/v1/transactions"

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transaction["id"]).to eq(1)
    expect(transaction["invoice_id"]).to eq(db_transaction.invoice_id)
    expect(transaction["credit_card_number"]).to eq(db_transaction.credit_card_number)
    expect(transaction["credit_card_expiration_date"]).to eq(db_transaction.credit_card_expiration_date)
    expect(transaction["result"]).to eq("success")
  end


    it "shows one transaction" do
      db_transaction = create(:transaction)
      get "/api/v1/transactions/#{db_transaction.id}"

      expect(response).to be_success

      transaction = JSON.parse(response.body)
      expect(transaction["id"]).to eq(db_transaction.id)
      expect(transaction["invoice_id"]).to eq(db_transaction.invoice_id)
      expect(transaction["credit_card_number"]).to eq(db_transaction.credit_card_number)
      expect(transaction["credit_card_expiration_date"]).to eq(db_transaction.credit_card_expiration_date)
      expect(transaction["result"]).to eq("success")
    end

end
