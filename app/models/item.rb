class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def best_day
    invoices = self.invoices.joins(:invoice_items).group('invoices.id, invoices.created_at').order('sum(invoice_items.quantity) DESC, invoices.created_at DESC')

    date = invoices.first.created_at
    {best_day: date}
  end

end
