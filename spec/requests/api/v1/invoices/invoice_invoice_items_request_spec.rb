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
    expect(invoice_items).to eq(JSON.parse(invoice.invoice_items.to_json))
  end
end
