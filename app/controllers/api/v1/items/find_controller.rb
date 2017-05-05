class Api::V1::Items::FindController < ApplicationController

  def index
    params[:unit_price].gsub!('.', '') if params[:unit_price]
    render json: Item.where(search_params)
  end


  def show
    params[:unit_price].gsub!('.', '') if params[:unit_price]
    render json: Item.find_by(search_params)
  end


  private

  def search_params
    params.permit(:id,
                  :name,
                  :description,
                  :unit_price,
                  :merchant_id,
                  :created_at,
                  :updated_at)
  end
end
