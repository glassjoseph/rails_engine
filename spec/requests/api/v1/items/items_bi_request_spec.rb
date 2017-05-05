require 'rails_helper'


RSpec.describe 'Item Business Intelligence API' do
  it 'returns date with the most sales for an item' do
      create_list(:item, 3)
      create_list(:invoice, 5)
      item = Item.first

      Invoice.update_all(created_at: "2012-03-25T13:54:11.000Z")
      Invoice.first.update(created_at: "2000-11-25T13:54:11.000Z")

      item.invoices << Invoice.all



      get "/api/v1/items/#{item.id}/best_day"

      date = JSON.parse(response.body)

      expect(response).to be_success
      expect(date["best_day"]).to eq("2012-03-25T13:54:11.000Z")
    end

  it 'returns top items by number sold' do
      create_list(:item, 5)
      create_list(:invoice, 5)
      item1 = Item.first
      item2 = Item.second

      Invoice.all do |inv|
        inv.transactions << create(:transaction)
      end

      Invoice.first.invoice_items << create(:invoice_item, quantity: 99)

      item1.invoices << Invoice.first
      item2.invoices << Invoice.last




      get "/api/v1/items/most_items?quantity=1"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items[0]).to eq(item1[0])
    end
  end
