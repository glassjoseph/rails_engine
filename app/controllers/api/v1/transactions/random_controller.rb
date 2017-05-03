class Api::V1::Transactions::RandomController < ApplicationController

  def show
    render json: Transaction.find(1 + rand(Transaction.count))
  end


  private

  def search_params
    params.permit(:id,
                  :invoice_id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :created_at,
                  :updated_at)
  end
end
