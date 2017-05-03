require 'rails_helper'


RSpec.describe "Merchants API" do
  it "shows all merchants" do
    create_list(:merchant, 3)

    get "/api/v1/merchants"

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchant).to have_key("id")
    expect(merchant["id"]).to eq(Merchant.first.id)
    expect(merchant).to have_key("name")
    expect(merchant["name"]).to eq(Merchant.first.name)
    expect(merchant).to_not have_key("created_at")
    expect(merchant).to_not have_key("updated_at")
  end

  it "shows one merchant" do
    id = create(:merchant).id
    get "/api/v1/merchants/#{id}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant["id"]).to eq(id)
    expect(merchant).to have_key("name")
    expect(merchant["name"]).to eq(Merchant.last.name)
    expect(merchant).to_not have_key("created_at")
    expect(merchant).to_not have_key("updated_at")
  end
end
