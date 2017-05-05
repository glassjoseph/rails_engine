class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def best_day
    invoices = self.invoices.joins(:invoice_items).group('invoices.id, invoices.created_at').order('sum(invoice_items.quantity) DESC, invoices.created_at DESC')

    date = invoices.first.created_at
    {best_day: date}
  end

  def self.most_items(limit = 5)
    Item.joins(:invoice_items, invoices: :transactions).merge(Transaction.successful).order( 'sum(invoice_items.quantity) DESC').group(:id).limit(limit)
  end

  def self.most_revenue(number_of_items)
  joins(:invoice_items)
    .merge(InvoiceItem.successful)
    .group("items.id")
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .take(number_of_items.to_i)
  end


end
