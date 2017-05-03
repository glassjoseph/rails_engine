require 'rails_helper'

RSpec.describe "Merchant item API" do
  it "returns all items for a merchant" do

    merchant = create(:merchant)

    3.times do
      merchant.items << create(:item)
    end

    db_item = merchant.items.first

    get "/api/v1/merchants/#{merchant.id}/items"


    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items).to eq(JSON.parse(merchant.items.to_json))
  end
end
