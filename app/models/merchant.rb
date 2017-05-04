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

  def self.most_items(limit)
    Merchant.joins(:items).order('count(items.merchant_id) DESC').group(:id).limit(limit)
  end


# Company.joins(:jobs).group("companies.id").order("count(companies.id) DESC"

end
