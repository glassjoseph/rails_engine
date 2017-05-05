require 'rails_helper'

RSpec.describe "invoice_item find API" do

  it "can find invoice_item by id" do

    db_invoice_item = create(:invoice_item, id: 999)
    get "/api/v1/invoice_items/find?id=999"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item['id']).to eq(999)
  end


  it "can find invoice_item by item_id" do
    item = create(:item)
    db_invoice_item = create(:invoice_item, item: item)
    get "/api/v1/invoice_items/find?item_id=#{item.id}"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item['id']).to eq(db_invoice_item.id)
    expect(invoice_item['item_id']).to eq(item.id)
  end

  it "can find invoice_item by invoice_id" do
    invoice = create(:invoice)
    db_invoice_item = create(:invoice_item, invoice: invoice)
    get "/api/v1/invoice_items/find?invoice_id=#{invoice.id}"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item['id']).to eq(db_invoice_item.id)
    expect(invoice_item['invoice_id']).to eq(invoice.id)
  end

  it "can find invoice_item by quantity" do

    db_invoice_item = create(:invoice_item, quantity: 3)
    get "/api/v1/invoice_items/find?quantity=3"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item['id']).to eq(db_invoice_item.id)
    expect(invoice_item['quantity']).to eq(db_invoice_item.quantity)
  end


    it "can find invoice_item by unit price" do

      db_invoice_item = create(:invoice_item, unit_price: 44)
      get "/api/v1/invoice_items/find?unit_price=44"
      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item['id']).to eq(db_invoice_item.id)
      expect(invoice_item['unit_price']).to eq(((db_invoice_item.unit_price).to_f/100).to_s)
    end


  it "can find invoice_item by created_at" do
    db_invoice_item = create(:invoice_item, created_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/invoice_items/find?created_at='2012-03-27T14:56:04.000Z'"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item['id']).to eq(db_invoice_item.id)
    expect(invoice_item['created_at']).to be_nil
  end

  it "can find invoice_item by updated_at" do
    db_invoice_item = create(:invoice_item, updated_at: "2012-03-27T14:56:04.000Z")
    get "/api/v1/invoice_items/find?updated_at='2012-03-27T14:56:04.000Z'"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item['id']).to eq(db_invoice_item.id)
  end



  it "can find all invoice_items by item_id" do
    item = create(:item)
    db_invoice_item1 = create(:invoice_item, item: item)
    db_invoice_item2 = create(:invoice_item, item: item)
    db_invoice_item3 = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/find_all?item_id=#{item.id}"
    invoice_items = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first['id']).to eq(db_invoice_item1.id)
    expect(invoice_items.first['item_id']).to eq(item.id)
  end

  it "can find all invoice_items by invoice_id" do
    invoice = create(:invoice)
    db_invoice_item1 = create(:invoice_item, invoice: invoice)
    db_invoice_item2 = create(:invoice_item, invoice: invoice)
    db_invoice_item3 = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice.id}"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first['id']).to eq(db_invoice_item1.id)
    expect(invoice_items.first['invoice_id']).to eq(invoice.id)
  end

  it "can find all invoice_items by quantity" do

    db_invoice_item1 = create(:invoice_item, quantity: 1)
    db_invoice_item2 = create(:invoice_item, quantity: 1)
    db_invoice_item3 = create(:invoice_item, quantity: 1)

    get "/api/v1/invoice_items/find_all?quantity=1"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first['id']).to eq(db_invoice_item1.id)
    expect(invoice_items.first['quantity']).to eq(db_invoice_item1.quantity)
  end


    it "can find all invoice_items by unit price" do

      db_invoice_item1 = create(:invoice_item, unit_price: 1)
      db_invoice_item2 = create(:invoice_item, unit_price: 1)
      db_invoice_item3 = create(:invoice_item, unit_price: 1)

      get "/api/v1/invoice_items/find_all?unit_price=1"
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(3)
      expect(invoice_items.first['id']).to eq(db_invoice_item1.id)
      expect(invoice_items.first['unit_price']).to eq(((db_invoice_item1.unit_price).to_f/100).to_s)
    end

  it "can find all invoice_items by created_at" do

    db_invoice_item1 = create(:invoice_item, created_at: "2012-03-27T14:56:04.000Z")
    db_invoice_item2 = create(:invoice_item, created_at: "2012-03-27T14:56:04.000Z")
    db_invoice_item3 = create(:invoice_item, created_at: "2012-03-27T14:56:04.000Z")

    get "/api/v1/invoice_items/find_all?created_at='2012-03-27T14:56:04.000Z'"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first['id']).to eq(db_invoice_item1.id)
    expect(invoice_items.first['created_at']).to be_nil
  end

  it "can find all invoice_items by updated_at" do

    db_invoice_item1 = create(:invoice_item, updated_at: "2012-03-27T14:56:04.000Z")
    db_invoice_item2 = create(:invoice_item, updated_at: "2012-03-27T14:56:04.000Z")
    db_invoice_item3 = create(:invoice_item, updated_at: "2012-03-27T14:56:04.000Z")

    get "/api/v1/invoice_items/find_all?updated_at='2012-03-27T14:56:04.000Z'"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first['id']).to eq(db_invoice_item1.id)
    expect(invoice_items.first['updated_at']).to be_nil
  end
end
