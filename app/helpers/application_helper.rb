module ApplicationHelper
  def cart_badge
    cart = get_current_cart
    puts cart.total_item_count
     if cart
       puts cart
      if cart.total_item_count>0
          return "购物车<span class='badge'>#{cart.total_item_count}</span>"
      end
   end
   return '购物车'
  end

  def cart_show_path(cart)
    if cart
      return cart_path cart.id
    else
      return cart_index_path
    end
  end

  def get_current_cart
    current_cart=Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    current_cart = Cart.create
    session[:cart_id] = current_cart.id
    current_cart
  end
end
