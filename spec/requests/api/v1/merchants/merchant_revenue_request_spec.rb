require 'rails_helper'

RSpec.describe "Merchant revenue API" do
  it "returns revenue for a merchant" do

    merchant = create(:merchant_with_invoices)

    merchant.invoices.each do |invoice|
      invoice.invoice_items << create(:invoice_item)
      invoice.transactions << create(:transaction)
    end

    get "/api/v1/merchants/#{merchant.id}/revenue"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["revenue"]).to eq(4800)
  end
end
