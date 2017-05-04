class Api::V1::Merchants::PendingInvoicesController < ApplicationController

  def show
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.customers_with_pending_invoices
  end

end
