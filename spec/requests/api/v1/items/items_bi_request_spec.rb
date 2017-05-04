require 'rails_helper'


RSpec.describe 'Item Business Intelligence API' do
  it 'returns date with the most sales for an item' do

    # returns the date with the most sales for the given item using the invoice date.
    #If there are multiple days with equal number of sales, return the most recent day.
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
  end
