class DeliveryController < ApplicationController
  def index
    @foods=Food.page params[:page]
  end

  def who_bought
    @food = Food.find(params[:id])
    respond_to do |format|
      format.atom
    end
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
