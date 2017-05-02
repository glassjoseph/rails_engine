require 'rails_helper'

RSpec.describe "Invoices API" do
  it "shows all invoices" do
    create_list(:invoice, 3)

    db_invoice = Invoice.first

    get "/api/v1/invoices"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoice["id"]).to eq(1)
    expect(invoice["customer_id"]).to eq(db_invoice.customer_id)
    expect(invoice["merchant_id"]).to eq(db_invoice.merchant_id)
    expect(invoice["status"]).to eq("shipped")
  end


    it "shows one invoice" do
      invoice = create(:invoice)
      get "/api/v1/invoices/#{invoice.id}"

      expect(response).to be_success

      merchant = JSON.parse(response.body)
      expect(invoice["id"]).to eq(invoice.id)
      expect(invoice["customer_id"]).to eq(invoice.customer_id)
      expect(invoice["merchant_id"]).to eq(invoice.merchant_id)
      expect(invoice["status"]).to eq(invoice.status)
    end

end
