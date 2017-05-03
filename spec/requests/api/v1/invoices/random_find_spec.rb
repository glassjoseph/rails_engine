
RSpec.describe "API random functionality" do
  it "returns random invoice" do
    db_invoice1 = create(:invoice, updated_at: "2012-03-27T14:56:04.000Z")
    db_invoice2 = create(:invoice, updated_at: "2012-03-27T14:56:04.000Z")
    db_invoice3 = create(:invoice, updated_at: "2012-03-27T14:56:04.000Z")
    binding.pry
    get "/api/v1/invoices/random"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.count).to eq(1)

  end
end


#the non truncation of ids after tests are run is making this hard to test
