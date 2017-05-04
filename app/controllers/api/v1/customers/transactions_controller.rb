class Api::V1::Customers::TransactionsController < ApplicationController

  def show
    render json:  Transaction.where(invoice_id: Invoice.where(customer_id: params[:customer_id]) ) 
  end
end
