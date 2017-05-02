require 'pry'
namespace :data_import do
  desc "Import CSVs"
  task csv_load: :environment do
    require 'CSV'
    merchants = CSV.open('lib/data/merchants.csv', headers: true, header_converters: :symbol)
    merchants.each do |row|
      Merchant.create(name: row[:name], created_at: row[:created_at], updated_at: row[:updated_at])
    end

    items = CSV.open('lib/data/items.csv', headers: true, header_converters: :symbol)
    items.each do |row|
       Item.create(name: row[:name], description: row[:description], unit_price: row[:unit_price], merchant_id: row[:merchant_id], created_at: row[:created_at], updated_at: row[:updated_at])
    end

    invoices = CSV.open('lib/data/invoices.csv', headers: true, header_converters: :symbol)
    invoices.each do |row|
      Invoice.create(customer_id: row[:customer_id], description: row[:description], status: row[:status], unit_price: row[:unit_price], merchant_id: row[:merchant_id], created_at: row[:created_at], updated_at: row[:updated_at])
    end

    customers = CSV.open('lib/data/customers.csv', headers: true, header_converters: :symbol)
    customers.each do |row|
      Customer.create(first_name: row[:first_name], last_name: row[:last_name], created_at: row[:created_at], updated_at: row[:updated_at])
    end

    invoice_items = CSV.open('lib/data/invoice_items.csv', headers: true, header_converters: :symbol)
    invoice_items.each do |row|
      InvoiceItem.create(item_id: row[:item_id], invoice_id: row[:invoice_id], quantity: row[:quantity], unit_price: row[:unit_price], created_at: row[:created_at], updated_at: row[:updated_at])
    end

    transactions = CSV.open('lib/data/transactions.csv', headers: true, header_converters: :symbol)
    transactions.each do |row|
      Transaction.create(invoice_id: row[:invoice_id], credit_card_number: row[:credit_card_number], credit_card_expiration_date: row[:credit_card_expiration_date],  result: row[:result], created_at: row[:created_at], updated_at: row[:updated_at])
    end

  end
end
