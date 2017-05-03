require 'rails_helper'

RSpec.describe "API random functionality" do
  it "returns random customer" do
    create_list(:customer, 3)
    db_customer1 = Customer.first
    db_customer2 = Customer.second

    get "/api/v1/customers/random"

    customer = JSON.parse(response.body)

    expect(response).to be_success

    expect(customer[0]).to be_nil
    expect(customer).to include("first_name")
    expect(customer).to include("last_name")
    expect(customer["first_name"]).to be_in(Customer.pluck(:first_name))
  end
end


#the non truncation of ids after tests are run is making this hard to test
