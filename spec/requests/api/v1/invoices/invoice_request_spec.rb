require 'rails_helper'

RSpec.describe "Invoices API" do
  it "shows all invoices" do
    create_list(:invoice, 3)

    db_invoice = Invoice.first

    get "/api/v1/invoices"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoice["id"]).to eq(db_invoice.id)
    expect(invoice["customer_id"]).to eq(db_invoice.customer_id)
    expect(invoice["merchant_id"]).to eq(db_invoice.merchant_id)
    expect(invoice["status"]).to eq("shipped")
  end


    it "shows one invoice" do
      db_invoice = create(:invoice)
      get "/api/v1/invoices/#{db_invoice.id}"

      expect(response).to be_success

      invoice = JSON.parse(response.body)
      expect(invoice["id"]).to eq(db_invoice.id)
      expect(invoice["customer_id"]).to eq(db_invoice.customer_id)
      expect(invoice["merchant_id"]).to eq(db_invoice.merchant_id)
      expect(invoice["status"]).to eq(db_invoice.status)
    end

end
