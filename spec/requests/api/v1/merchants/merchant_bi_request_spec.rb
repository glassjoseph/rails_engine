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

  end

  it "returns merchants favorite customer" do

    merchant = create(:merchant_with_invoices)
    
    merchant.invoices.update_all(created_at: "2012-03-25T13:54:11.000Z")

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
  


it "returns revenue from a certain date for a merchant" do
    merchant = create(:merchant_with_invoices)
    merchant.invoices.update_all(created_at: "2012-03-25T13:54:11.000Z")


    merchant.invoices.each do |invoice|
      invoice.invoice_items << create(:invoice_item)
      invoice.transactions << create(:transaction)
    end
  
    diff_date_invoice.invoice_items << create(:invoice_item)
    merchant.invoices << diff_date_invoice

    get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-25T13:54:11.000Z"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["revenue"]).to eq(4800)
  end

  it "returns merchants with most items" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)
    create_list(:item, 10)

    merchant1.items << Item.take(10)
    merchant2.items << Item.take(4)
    merchant3.items << Item.take(1)

    get "/api/v1/merchants/most_items/?quantity=1"


    merchant = JSON.parse(response.body)[0]

    expect(response).to be_success
    expect(merchant["id"]).to eq(merchant1.id)
    expect(merchant["name"]).to eq(merchant1.name)

    get "/api/v1/merchants/most_items/?quantity=2"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.first["id"]).to eq(merchant1.id)
    expect(merchants.first["name"]).to eq(merchant1.name)
    expect(merchants.second["id"]).to eq(merchant2.id)
    expect(merchants.second["name"]).to eq(merchant2.name)
  end
end
