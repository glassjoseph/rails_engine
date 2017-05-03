class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    render json: InvoiceItem.find(1 + rand(InvoiceItem.count))
  end


  private

  def search_params
    params.permit(:id,
                  :item_id,
                  :invoice_id,
                  :quantity,
                  :unit_price,
                  :created_at,
                  :updated_at)
  end
end
