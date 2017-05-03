require 'rails_helper'

RSpec.describe "Merchant find API" do
  it "can find merchant by name" do

    db_merchant = create(:merchant, name: "James")
    get "/api/v1/merchants/find?name=James"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant['id']).to eq(db_merchant.id)
    expect(merchant['name']).to eq(db_merchant.name)
  end

  it "can find merchant by id" do

    db_merchant = create(:merchant, id: 899)
    get "/api/v1/merchants/find?id=899"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant['id']).to eq(899)
    expect(merchant['name']).to eq(db_merchant.name)
  end

  it "can find all merchants with find_all" do

    db_merchant1 = create(:merchant, name: "James")
    db_merchant2 = create(:merchant, name: "James")
    db_merchant3 = create(:merchant, name: "James")

    get "/api/v1/merchants/find_all?name=James"
    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.count).to eq(3)
    expect(merchants.first['id']).to eq(db_merchant1.id)
    expect(merchants.first['name']).to eq("James")
  end
end
