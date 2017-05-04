class Api::V1::Merchants::RevenuesController < ApplicationController

  def show
    # binding.pry
    merchant = Merchant.find(params[:merchant_id])
    if params[:date]
      render json: merchant.revenue_by_date(params[:date])
    else
      render json: merchant.revenue
    end
  end

  private


end
