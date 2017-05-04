class Api::V1::Merchants::FindController < ApplicationController


  def index
    render json: Merchant.where(search_params)
  end


  def show
    render json: Merchant.find_by(search_params)
    # For future case-insensitivity

    #search_params.values.first.downcase!
    # Merchant.find_by("lower(name) = ?", search_params["name"].downcase)

  end


  private

  def search_params
    params.permit(:id,
                  :name,
                  :created_at,
                  :updated_at)
  end
end
