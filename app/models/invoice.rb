class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  scope :successful_transactions, -> { joins(:transactions, :invoice_items).where('result = 1') }
end


  def most_expensive(limit = 5)

    # first attempt
    # Invoice.joins(:transactions, :invoice_items).where('result = 1').order("(unit_price * quantity) DESC" ).last(5)
    # Invoice.successful_transactions.order("(unit_price * quantity) DESC" ).limit(limit)

    # successful
    # Invoice.select("invoices.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total").joins(:transactions, :invoice_items).where(transactions: {result: 1}).group(:id).order("total DESC").limit(limit)

    Invoice.select("invoices.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total").joins(:transactions, :invoice_items).merge(Transaction.successful).group(:id).order("total DESC").limit(limit)
  end

  #Total revenue from all
  #  Invoice.joins(:transactions, :invoice_items).where('result = 1').sum("unit_price * quantity" )
