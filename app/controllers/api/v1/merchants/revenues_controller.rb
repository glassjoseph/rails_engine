class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    render json: Merchant.most_revenue_by_date(params[:date])
  end

  def show
    merchant = Merchant.find(params[:merchant_id])
    if params[:date]
      render json: merchant.revenue_by_date(params[:date])
    else
      render json: merchant.revenue
    end
  end

end
