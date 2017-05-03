class Api::V1::Items::RandomController < ApplicationController

  def show
    render json: Item.find(1 + rand(Item.count))
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
