class Api::V1::Merchants::RevenuesController < ApplicationController

  def show
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.revenue
  end
end
