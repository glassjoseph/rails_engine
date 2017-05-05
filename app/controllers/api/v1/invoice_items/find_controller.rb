class Api::V1::InvoiceItems::FindController < ApplicationController


  def index

      params[:unit_price].gsub!('.', '') if params[:unit_price]
      render json: InvoiceItem.where(search_params)
  end


  def show
    params[:unit_price].gsub!('.', '') if params[:unit_price]
    render json: InvoiceItem.find_by(search_params)
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
