require 'rails_helper'

RSpec.describe "Merchant invoice API" do
  it "returns all invoices for a merchant" do
    #returns a collection of invoices associated with that merchant from their known orders

    merchant = create(:merchant_with_invoices)
    db_invoice = merchant.invoices.first

    get "/api/v1/merchants/#{merchant.id}/invoices"


    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices).to eq(JSON.parse(merchant.invoices.to_json))
  end
end
