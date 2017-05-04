require 'rails_helper'

RSpec.describe "Customer transaction API" do

  it "returns all transactions for a customer" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = Invoice.create(customer: customer, merchant: merchant)
    transaction = Transaction.create(invoice: invoice)

    db_invoice = customer.invoices.first

    get "/api/v1/customers/#{customer.id}/transactions"


    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
  end

  #need to find a way to test this more effectively
end
