class Api::V1::Customers::RandomController < ApplicationController

  def show
    render json: Customer.find(1 + rand(Customer.count))
  end


  private

  def search_params
    params.permit(:id,
                  :first_name,
                  :last_name,
                  :created_at,
                  :updated_at)
  end
end
