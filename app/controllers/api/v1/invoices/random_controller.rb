class Api::V1::Invoices::RandomController < ApplicationController

  def show
    render json: Invoice.find(1 + rand(Invoice.count))
  end

end
