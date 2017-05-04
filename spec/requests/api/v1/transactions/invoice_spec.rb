require 'rails_helper'


RSpec.describe "Transactions API" do
  it "can find the invoice associated with a transaction" do
    transaction_with_invoice = create(:transaction)


    get "/api/v1/transactions/#{transaction_with_invoice.id}/invoice"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to eq(JSON.parse(transaction_with_invoice.invoice.to_json))
  end
end
