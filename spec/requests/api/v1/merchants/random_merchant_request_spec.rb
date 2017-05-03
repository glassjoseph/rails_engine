require 'rails_helper'

RSpec.describe "API random functionality" do
  it "returns random merchant" do
    create_list(:merchant, 3)

    get "/api/v1/merchants/random"

    merchant = JSON.parse(response.body)

    expect(response).to be_success

    expect(merchant[0]).to be_nil
    expect(merchant).to include("name")
    expect(merchant).to include("id")
    expect(merchant["name"]).to be_in(Merchant.pluck(:name))
  end
end


#the non truncation of ids after tests are run is making this hard to test
