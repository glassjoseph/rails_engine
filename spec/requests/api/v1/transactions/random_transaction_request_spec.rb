require 'rails_helper'

RSpec.describe "API random functionality" do
  it "returns random transaction" do
    create_list(:transaction, 3)

    get "/api/v1/transactions/random"

    transaction = JSON.parse(response.body)

    expect(response).to be_success

    expect(transaction[0]).to be_nil
    expect(transaction).to include("invoice_id")
    expect(transaction).to include("credit_card_number")
    expect(transaction["credit_card_number"]).to be_in(Transaction.pluck(:credit_card_number))
  end
end


#the non truncation of ids after tests are run is making this hard to test
