require 'rails_helper'

RSpec.describe "invoice_item API" do

  it "returns the invoice for a invoice_item" do

    db_invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{db_invoice_item.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success

    expect(invoice["id"]).to eq(db_invoice_item.invoice.id)
    expect(invoice["merchant_id"]).to eq(db_invoice_item.invoice.merchant_id)
    expect(invoice["customer_id"]).to eq(db_invoice_item.invoice.customer_id)
  end

  it "returns the item for a invoice_item" do

    db_invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{db_invoice_item.id}/item"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(db_invoice_item.item.id)
    expect(item["merchant_id"]).to eq(db_invoice_item.item.merchant_id)
    expect(item["unit_price"]).to eq(db_invoice_item.item.unit_price)
    expect(item["description"]).to eq(db_invoice_item.item.description)
  end
end
