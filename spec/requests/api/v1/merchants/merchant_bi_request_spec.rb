require 'rails_helper'

RSpec.describe "Merchant BI API" do
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

  it "returns customers with pending invoices" do

    merchant = create(:merchant_with_invoices)

    invoice = merchant.invoices.first

    3.times do
      invoice.transactions << create(:failed_transaction)
    end

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

    customers = JSON.parse(response.body)
    customer = customers.first
    expect(response).to be_success
    expect(customers.count).to eq(1)
    expect(customer["id"]).to eq(1)

  end

  it "returns merchants favorite customer" do

    merchant = create(:merchant_with_invoices)

    invoice = merchant.invoices.first
    inv_customer = invoice.customer

    3.times do
      invoice.transactions << create(:transaction)
    end

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(inv_customer.first_name)
    expect(customer["last_name"]).to eq(inv_customer.last_name)
    expect(customer["id"]).to eq(inv_customer.id)

  end
end
