require 'rails_helper'

RSpec.describe "Customer invoice API" do

  it "returns all invoices for a customer" do

    customer = create(:customer)
    customer.invoices << create(:invoice)

    db_invoice = customer.invoices.first

    get "/api/v1/customers/#{customer.id}/invoices"


    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoice['id']).to eq(db_invoice.id)
    expect(invoice['customer_id']).to eq(db_invoice.customer_id)
    expect(invoice['merchant_id']).to eq(db_invoice.merchant_id)
    expect(invoice['status']).to eq(db_invoice.status)
  end
end
