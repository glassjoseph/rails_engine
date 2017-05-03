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
    expect(invoices).to eq(JSON.parse(customer.invoices.to_json))
  end
end
