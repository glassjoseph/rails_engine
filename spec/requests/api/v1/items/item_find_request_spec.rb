require 'rails_helper'

RSpec.describe "Customer find API" do
  it "can find item by name" do

    db_item = create(:item, name: "James")
    get "/api/v1/items/find?name=James"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq(db_item.id)
    expect(item['name']).to eq(db_item.name)
  end

  it "can find item by description" do

    db_item = create(:item, description: "N64")
    get "/api/v1/items/find?description=N64"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq(db_item.id)
    expect(item['description']).to eq(db_item.description)
  end

  it "can find item by unit_price" do

    db_item = create(:item, unit_price: "1500")
    get "/api/v1/items/find?unit_price=1500"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq(db_item.id)
    expect(item['unit_price']).to eq(db_item.unit_price)
  end

  it "can find item by id" do

    db_item = create(:item, id: 899)
    get "/api/v1/items/find?id=899"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq(899)
    expect(item['name']).to eq(db_item.name)
  end

  it "can find all items with find_all" do

    db_item1 = create(:item, name: "Pizza")
    db_item2 = create(:item, name: "Pizza")
    db_item3 = create(:item, name: "Pizza")
    db_item4 = create(:item, name: "Magic Eight Ball")

    get "/api/v1/items/find_all?name=Pizza"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(items.first['id']).to eq(db_item1.id)
    expect(items.first['name']).to eq("Pizza")
  end


  it "can find item by created_at" do
    db_item = create(:item, created_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/items/find?created_at='2012-03-27T14:56:04.000Z'"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq(db_item.id)
  end

  it "can find item by updated_at" do
    db_item = create(:item, updated_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/items/find?updated_at='2012-03-27T14:56:04.000Z'"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq(db_item.id)
  end

end
