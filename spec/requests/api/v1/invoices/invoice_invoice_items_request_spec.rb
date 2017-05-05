require 'rails_helper'

RSpec.describe "Invoice invoice items API" do
  it "returns all invoice items for an invoice" do

    invoice = create(:invoice)

    invoice.invoice_items << create(:invoice_item)

    db_invoice_item = invoice.invoice_items.first

    get "/api/v1/invoices/#{invoice.id}/invoice_items"


    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.first["item_id"]).to eq(db_invoice_item.item_id)
    expect(invoice_items.first["invoice_id"]).to eq(db_invoice_item.invoice_id)
    expect(invoice_items.first["quantity"]).to eq(db_invoice_item.quantity)
  end
end
