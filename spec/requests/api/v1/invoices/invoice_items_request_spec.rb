require 'rails_helper'

RSpec.describe "Invoice item API" do
  it "returns all items for an invoice" do

    invoice = create(:invoice)

    invoice.items << create_list(:item, 2)

    db_item = invoice.items.first

    get "/api/v1/invoices/#{invoice.id}/items"


    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(item["id"]).to eq(db_item.id)
    expect(item["name"]).to eq(db_item.name)
    expect(item["description"]).to eq(db_item.description)
  end
end
