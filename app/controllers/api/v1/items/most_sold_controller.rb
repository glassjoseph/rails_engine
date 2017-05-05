class Api::V1::Items::MostSoldController < ApplicationController

  def show
    render json: Item.most_items(params[:quantity])
  end

end
