require 'rails_helper'

RSpec.describe "Merchant item API" do
  it "returns all items for a merchant" do

    merchant = create(:merchant)

    3.times do
      merchant.items << create(:item)
    end

    db_item = merchant.items.first
    db_item2 = merchant.items.second

    get "/api/v1/merchants/#{merchant.id}/items"


    items = JSON.parse(response.body)
    item = items.first
    item2 = items.second

    expect(response).to be_success
    # expect(item).to eq(JSON.parse(merchant.items.to_json))
    expect(item["id"]).to eq(db_item.id)
    expect(item["name"]).to eq(db_item.name)
    expect(item["description"]).to eq(db_item.description)
    expect(item["merchant_id"]).to eq(db_item.merchant_id)
    expect(item2["id"]).to eq(db_item2.id)
    expect(item2["name"]).to eq(db_item2.name)
    expect(item2["description"]).to eq(db_item2.description)
    expect(item2["merchant_id"]).to eq(db_item2.merchant_id)
  end
end
