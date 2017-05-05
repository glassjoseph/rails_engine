require 'rails_helper'
RSpec.describe "Customer Business Intelligence API" do

  it "returns a customers favorite merchant" do

    customer = create(:customer)
    customer.merchants << create_list(:merchant_with_invoices, 2)
    merchant1 = customer.merchants.first
    merchant1.invoices.update_all(customer_id: customer)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants["name"]).to eq(merchant1.name)
    expect(merchants["id"]).to eq(merchant1.id)
  end
end
