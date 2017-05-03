require 'rails_helper'

RSpec.describe "Customers API" do
  it "shows all customers" do
    create_list(:customer, 3)
    db_customer = Customer.first

    get "/api/v1/customers"

    customers = JSON.parse(response.body)
    customer = customers.first

    expect(response).to be_success
    expect(customer["id"]).to eq(db_customer.id)
    expect(customer["first_name"]).to eq(db_customer.first_name)
    expect(customer["last_name"]).to eq(db_customer.last_name)
  end

  it "shows one customer" do
    db_customer = create(:customer)
    get "/api/v1/customers/#{db_customer.id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["id"]).to eq(db_customer.id)
    expect(customer["first_name"]).to eq(db_customer.first_name)
    expect(customer["last_name"]).to eq(db_customer.last_name)
  end
end
