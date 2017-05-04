class Api::V1::Merchants::ItemsController < ApplicationController

  def show
    if params[:quantity]
      render json: Merchant.most_items(params[:quantity])
    else
      render json:  Merchant.find(params[:merchant_id]).items
    end
  end


end
