require 'rails_helper'


RSpec.describe "Merchants API" do
  it "shows all merchants" do
    get "/api/v1/merchants"

    expect(response).to be_success
  end

  it "shows one merchant" do
    id = create(:merchant).id
    get "/api/v1/merchants/#{id}"

    expect(response).to be_success
  end




end
