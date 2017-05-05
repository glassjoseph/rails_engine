require 'rails_helper'
RSpec.describe "API random functionality" do
  it "returns random invoice item" do
    db_invoice1 = create(:invoice_item, updated_at: "2012-03-27T14:56:04.000Z")
    db_invoice2 = create(:invoice_item, updated_at: "2012-03-27T14:56:04.000Z")
    db_invoice3 = create(:invoice_item, updated_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/invoice_items/random"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.count).to eq(5)

  end
end


#the non truncation of ids after tests are run is making this hard to test
