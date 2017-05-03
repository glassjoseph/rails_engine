class Api::V1::Invoices::CustomersController < ApplicationController


  def index
    invoice = Invoice.find(params[:invoice_id])
    render json: invoice.customer
  end

end
