class Api::V1::Merchants::RandomController < ApplicationController

  def show
    render json: Merchant.find(1 + rand(Merchant.count))
  end


  private

  def search_params
    params.permit(:id,
                  :name,
                  :created_at,
                  :updated_at)
  end
end
