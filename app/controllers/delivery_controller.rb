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
    @cart = current_cart
    @line_item = @cart.add_food(params[:id])
    if @line_item.save
      render json: { state_code: 1, line_item_count: @cart.total_item_count}
    else
      render json: { state_code: 0}
    end
  end

  def removeFromCart
    puts params[:id]
    render json: { code: 0}
  end

end
