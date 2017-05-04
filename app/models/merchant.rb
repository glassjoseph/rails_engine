class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def revenue
    sum = invoices.successful_transactions.sum("unit_price * quantity")
    {revenue: sum}
  end

  def revenue_by_date(date)
    sum = invoices.successful_transactions.where(created_at: date).sum("unit_price * quantity")
    {revenue: sum}
  end

  def customers_with_pending_invoices
    failed_cust_ids =
    invoices.joins(:transactions).
    group('invoices.id').
    having('sum(transactions.result) = 0').
    pluck(:customer_id)

    Customer.where(id: failed_cust_ids)
  end
end
