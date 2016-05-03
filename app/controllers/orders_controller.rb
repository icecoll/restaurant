class OrdersController < InheritedResources::Base

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to delivery_path, :notice => '请先选择美食！!！'
      return
    end
    @order = Order.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        format.html { redirect_to(delivery_path, :notice =>
          '下单成功')}
      else
        format.html {render :action => 'new'}
      end

    end
  end

  private

    def order_params
      params.require(:order).permit(:name, :address, :phone, :pay_type)
    end
end

