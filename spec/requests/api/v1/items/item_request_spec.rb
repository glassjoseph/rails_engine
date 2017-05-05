require 'rails_helper'

RSpec.describe "Items API" do
  it "shows all items" do
    create_list(:item, 3)
    db_item = Item.first

    get "/api/v1/items"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(item["id"]).to eq(db_item.id)
    expect(item["name"]).to eq(db_item.name)
    expect(item["description"]).to eq("This is an item.")
    expect(item["merchant_id"]).to eq(db_item.merchant_id)
  end


  it "shows one item" do
    db_item = create(:item)
    get "/api/v1/items/#{db_item.id}"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(db_item.id)
    expect(item["name"]).to eq(db_item.name)
    expect(item["description"]).to eq(db_item.description)
    expect(item["merchant_id"]).to eq(db_item.merchant_id)
  end
end
