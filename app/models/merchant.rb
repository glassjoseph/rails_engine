class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def revenue
    sum = invoices.joins(:invoice_items).sum("unit_price * quantity")
    {revenue: sum}
  end
end
