class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def revenue
    sum = invoices.successful_transactions.sum("unit_price * quantity")
    {revenue: sum}
  end
end
