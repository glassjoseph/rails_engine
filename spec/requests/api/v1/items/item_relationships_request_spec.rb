require 'rails_helper'

RSpec.describe "Item API" do
  it "returns the merchant for a item" do

    db_item = create(:item)

    get "/api/v1/items/#{db_item.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success

    expect(merchant["id"]).to eq(db_item.merchant.id)
    expect(merchant["name"]).to eq(db_item.merchant.name)
  end

  it "returns the invoice_items for an item" do

    db_item = create(:item)
    db_invoice_item = create(:invoice_item)
    db_invoice_item2 = create(:invoice_item)
    db_item.invoice_items << [db_invoice_item, db_invoice_item2]

    get "/api/v1/items/#{db_item.id}/invoice_items"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first


    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
    expect(invoice_item["id"]).to eq(db_invoice_item.item.id)
    expect(invoice_item["quantity"]).to eq(db_invoice_item.quantity)
    expect(invoice_item["item_id"]).to eq(db_invoice_item.item_id)
  end
end
