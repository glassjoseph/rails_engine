require 'rails_helper'

RSpec.describe "Items API" do
  it "shows all items" do
    create_list(:item, 3)
    db_item = Item.first

    get "/api/v1/items"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(item["id"]).to eq(1)
    expect(item["name"]).to eq("Item # 2")
    expect(item["description"]).to eq("This is an item.")
    expect(item["unit_price"]).to eq(db_item.unit_price)
    expect(item["merchant_id"]).to eq(db_item.merchant_id)
  end


    it "shows one item" do
      item = create(:item)
      get "/api/v1/items/#{item.id}"

      expect(response).to be_success

      merchant = JSON.parse(response.body)
      expect(item["id"]).to eq(item.id)
      expect(item["name"]).to eq(item.name)
      expect(item["description"]).to eq(item.description)
      expect(item["unit_price"]).to eq(item.unit_price)
      expect(item["merchant_id"]).to eq(item.merchant_id)
    end

end
