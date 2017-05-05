require 'rails_helper'

RSpec.describe "Invoice item API" do
  it "returns all items for an invoice" do

    invoice = create(:invoice)

    invoice.items << create(:item)

    db_item = invoice.items.first

    get "/api/v1/invoices/#{invoice.id}/items"


    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items).to eq(JSON.parse(invoice.items.to_json))
  end
end
