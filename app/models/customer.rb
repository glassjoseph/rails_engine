class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices


  def favorite_merchant
    merchants.joins(:invoices).group('merchants.id').order('count(invoices) desc').first
  end

end
