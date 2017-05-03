require 'rails_helper'

RSpec.describe "InvoiceItems API" do
  it "shows all invoice_items" do
    create_list(:invoice_item, 3)
    db_invoice_item = InvoiceItem.first

    get "/api/v1/invoice_items"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(db_invoice_item.id)
    expect(invoice_item["item_id"]).to eq(db_invoice_item.item_id)
    expect(invoice_item["invoice_id"]).to eq(db_invoice_item.invoice_id)
    expect(invoice_item["quantity"]).to eq(db_invoice_item.quantity)
    expect(invoice_item["unit_price"]).to eq(db_invoice_item.unit_price)
  end


    it "shows one invoice_item" do
      db_invoice_item = create(:invoice_item)
      get "/api/v1/invoice_items/#{db_invoice_item.id}"

      expect(response).to be_success

      invoice_item = JSON.parse(response.body)
      expect(response).to be_success
      expect(invoice_item["id"]).to eq(db_invoice_item.id)
      expect(invoice_item["item_id"]).to eq(db_invoice_item.item_id)
      expect(invoice_item["invoice_id"]).to eq(db_invoice_item.invoice_id)
      expect(invoice_item["quantity"]).to eq(db_invoice_item.quantity)
      expect(invoice_item["unit_price"]).to eq(db_invoice_item.unit_price)
    end
end
