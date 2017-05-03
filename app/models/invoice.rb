class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  scope :successful_transactions, -> { joins(:transactions, :invoice_items).where('result = 1') }
end
