require 'rails_helper'

RSpec.describe "API random functionality" do
  it "returns random item" do
    create_list(:item, 3)

    get "/api/v1/items/random"

    item = JSON.parse(response.body)

    expect(response).to be_success

    expect(item[0]).to be_nil
    expect(item).to include("name")
    expect(item).to include("description")
    expect(item).to include("merchant_id")
    expect(item["name"]).to be_in(Item.pluck(:name))
  end
end


#the non truncation of ids after tests are run is making this hard to test
