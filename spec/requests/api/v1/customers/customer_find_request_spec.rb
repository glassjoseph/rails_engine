require 'rails_helper'

RSpec.describe "Customer find API" do
  it "can find customer by first_name" do

    db_customer = create(:customer, first_name: "James")
    get "/api/v1/customers/find?first_name=James"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer['id']).to eq(db_customer.id)
    expect(customer['first_name']).to eq(db_customer.first_name)
  end

  it "can find customer by last_name" do

    db_customer = create(:customer, last_name: "James")
    get "/api/v1/customers/find?last_name=James"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer['id']).to eq(db_customer.id)
    expect(customer['last_name']).to eq(db_customer.last_name)
  end

  it "can find customer by id" do

    db_customer = create(:customer, id: 899)
    get "/api/v1/customers/find?id=899"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer['id']).to eq(899)
    expect(customer['first_name']).to eq(db_customer.first_name)
  end

  it "can find all customers with find_all" do

    db_customer1 = create(:customer, first_name: "James")
    db_customer2 = create(:customer, first_name: "James")
    db_customer3 = create(:customer, first_name: "James")
    db_customer4 = create(:customer, first_name: "Ben")

    get "/api/v1/customers/find_all?first_name=James"
    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(3)
    expect(customers.first['id']).to eq(db_customer1.id)
    expect(customers.first['first_name']).to eq("James")
  end


  it "can find customer by created_at" do
    db_customer = create(:customer, created_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/customers/find?created_at='2012-03-27T14:56:04.000Z'"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer['id']).to eq(db_customer.id)
  end

  it "can find customer by updated_at" do
    db_customer = create(:customer, updated_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/customers/find?updated_at='2012-03-27T14:56:04.000Z'"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer['id']).to eq(db_customer.id)
  end

end
