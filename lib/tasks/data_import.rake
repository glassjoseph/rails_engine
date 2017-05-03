require 'pry'
namespace :data_import do
  desc "Import CSVs"
  task csv_load: :environment do
    require 'CSV'
    merchants = CSV.open('lib/data/merchants.csv', headers: true, header_converters: :symbol)
    merchants.each do |row|
      Merchant.create(name: row[:name],
       created_at: row[:created_at],
        updated_at: row[:updated_at])
    end
    puts "Merchants: #{Merchant.count}"

    items = CSV.open('lib/data/items.csv', headers: true, header_converters: :symbol)
    items.each do |row|
       Item.create(name: row[:name],
        description: row[:description],
        unit_price: row[:unit_price],
        merchant_id: row[:merchant_id],
        created_at: row[:created_at],
        updated_at: row[:updated_at])
    end
    puts "Items: #{Item.count}"

    customers = CSV.open('lib/data/customers.csv', headers: true, header_converters: :symbol)
    customers.each do |row|
      Customer.create(first_name: row[:first_name],
      last_name: row[:last_name],
      created_at: row[:created_at],
      updated_at: row[:updated_at])
    end
    puts "Customers: #{Customer.count}"

    invoices = CSV.open('lib/data/invoices.csv', headers: true, header_converters: :symbol)
    invoices.each do |row|
      Invoice.create!(customer_id: row[:customer_id],
      merchant_id: row[:merchant_id],
      status: row[:status],
      created_at: row[:created_at],
      updated_at: row[:updated_at])
    end

    puts "Invoices: #{Invoice.count}"


    invoice_items = CSV.open('lib/data/invoice_items.csv', headers: true, header_converters: :symbol)
    invoice_items.each do |row|
      InvoiceItem.create!(item_id: row[:item_id],
      invoice_id: row[:invoice_id],
      quantity: row[:quantity],
      unit_price: row[:unit_price],
      created_at: row[:created_at],
      updated_at: row[:updated_at])
    end

    puts "Invoice Items: #{InvoiceItem.count}"

    transactions = CSV.open('lib/data/transactions.csv', headers: true, header_converters: :symbol)
    transactions.each do |row|
      Transaction.create!(invoice_id: row[:invoice_id],
      credit_card_number: row[:credit_card_number],
      credit_card_expiration_date: row[:credit_card_expiration_date],
      result: result_conversion(row[:result]),
      created_at: row[:created_at],
      updated_at: row[:updated_at])
    end

    puts "Transactions: #{Transaction.count}"

  end
end

def result_conversion(result)
  result == "success" ? 1 : 0
end
