require 'rails_helper'

RSpec.describe "Invoice find API" do

  it "can find invoice by id" do

    db_invoice = create(:invoice, id: 999)
    get "/api/v1/invoices/find?id=999"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice['id']).to eq(999)
  end


  it "can find invoice by customer_id" do
    customer = create(:customer)
    db_invoice = create(:invoice, customer: customer)
    get "/api/v1/invoices/find?customer_id=#{customer.id}"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice['id']).to eq(db_invoice.id)
    expect(invoice['customer_id']).to eq(customer.id)
  end

  it "can find invoice by merchant_id" do
    merchant = create(:merchant)
    db_invoice = create(:invoice, merchant: merchant)
    get "/api/v1/invoices/find?merchant_id=#{merchant.id}"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice['id']).to eq(db_invoice.id)
    expect(invoice['merchant_id']).to eq(merchant.id)
  end

  it "can find invoice by status" do

    db_invoice = create(:invoice, status: 1)
    get "/api/v1/invoices/find?status=1"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice['id']).to eq(db_invoice.id)
    expect(invoice['status']).to eq(db_invoice.status)
  end

  it "can find invoice by created_at" do
    db_invoice = create(:invoice, created_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/invoices/find?created_at='2012-03-27T14:56:04.000Z'"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice['id']).to eq(db_invoice.id)
    expect(invoice['created_at']).to eq("2012-03-27T14:56:04.000Z")
  end

  it "can find invoice by updated_at" do
    db_invoice = create(:invoice, updated_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/invoices/find?updated_at='2012-03-27T14:56:04.000Z'"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice['id']).to eq(db_invoice.id)
  end



  it "can find all invoices by customer_id" do
    customer = create(:customer)
    db_invoice1 = create(:invoice, customer: customer)
    db_invoice2 = create(:invoice, customer: customer)
    db_invoice3 = create(:invoice, customer: customer)

    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"
    invoices = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices.first['id']).to eq(db_invoice1.id)
    expect(invoices.first['customer_id']).to eq(customer.id)
  end

  it "can find all invoices by merchant_id" do
    merchant = create(:merchant)
    db_invoice1 = create(:invoice, merchant: merchant)
    db_invoice2 = create(:invoice, merchant: merchant)
    db_invoice3 = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices.first['id']).to eq(db_invoice1.id)
    expect(invoices.first['merchant_id']).to eq(merchant.id)
  end

  it "can find all invoices by status" do

    db_invoice1 = create(:invoice, status: 1)
    db_invoice2 = create(:invoice, status: 1)
    db_invoice3 = create(:invoice, status: 1)

    get "/api/v1/invoices/find_all?status=1"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices.first['id']).to eq(db_invoice1.id)
    expect(invoices.first['status']).to eq(db_invoice1.status)
  end

  it "can find all invoices by created_at" do

    db_invoice1 = create(:invoice, created_at: "2012-03-27T14:56:04.000Z")
    db_invoice2 = create(:invoice, created_at: "2012-03-27T14:56:04.000Z")
    db_invoice3 = create(:invoice, created_at: "2012-03-27T14:56:04.000Z")

    get "/api/v1/invoices/find_all?created_at='2012-03-27T14:56:04.000Z'"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices.first['id']).to eq(db_invoice1.id)
    expect(invoices.first['created_at']).to eq("2012-03-27T14:56:04.000Z")
  end

  it "can find all invoices by updated_at" do

    db_invoice1 = create(:invoice, updated_at: "2012-03-27T14:56:04.000Z")
    db_invoice2 = create(:invoice, updated_at: "2012-03-27T14:56:04.000Z")
    db_invoice3 = create(:invoice, updated_at: "2012-03-27T14:56:04.000Z")

    get "/api/v1/invoices/find_all?updated_at='2012-03-27T14:56:04.000Z'"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices.first['id']).to eq(db_invoice1.id)
    expect(invoices.first['updated_at']).to eq("2012-03-27T14:56:04.000Z")
  end
end
