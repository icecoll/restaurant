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

  private

    def order_params
      params.require(:order).permit(:name, :address, :phone, :pay_type)
    end
end

