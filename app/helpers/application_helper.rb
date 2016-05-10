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

  def show_order_button(id)
    current_cart=get_current_cart
    if current_cart && current_cart.line_items.find(id)
      return " <%= link_to '  移除  ','#',class: 'button order_button remove_from_cart',id: '#{f.id}',style: 'display:none'%>"
    end
      return "<%= link_to '加入订单','#',class: 'button order_button add_to_cart',id: '#{f.id}'%>"
  end
end
