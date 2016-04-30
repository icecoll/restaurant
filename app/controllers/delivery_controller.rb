class DeliveryController < ApplicationController
  def index
    @foods=Food.page params[:page]
  end

  def addToCart
    puts params[:id]
    render json: { code: 0}
  end

  def removeFromCart
    puts params[:id]
    render json: { code: 0}
  end

end
