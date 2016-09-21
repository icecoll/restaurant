class CartController < ApplicationController
  def index
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error '尝试访问无效的购物车'
      redirect_to root_path, :notice => '无效的购物车'
    else
      @order = Order.new
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @order }
      end
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html {redirect_to (root_path),
        :notice => '购物车已清空'}
    end
  end
end

