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
    button_remove_show = link_to '  移除  ','javascript:;',class: 'btn btn-default order_button remove_from_cart',id: id, onclick:'orderButtonClicked(this)'
    button_add_hidden = link_to '加入购物车','javascript:;',class: 'btn btn-default order_button add_to_cart',id: id,style:'display:none', onclick:'orderButtonClicked(this)'
    button_remove_hidden =   link_to '  移除  ','javascript:;',class: 'btn btn-default order_button remove_from_cart',id: id,style:'display:none', onclick:'orderButtonClicked(this)'
    button_add_show =  link_to '加入购物车','javascript:;',class: 'btn btn-default order_button add_to_cart',id: id, onclick:'orderButtonClicked(this)'
    if current_cart.line_items
        if current_cart.contain_item?(id)
          return button_remove_show + button_add_hidden                         
        end
    end
    return button_add_show + button_remove_hidden
  end

  def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :success if type.to_sym == :notice
      type = :danger if type.to_sym == :alert
      text = content_tag(:div, link_to('x', 'javascript:;', :class => 'close', 'data-dismiss' => 'alert',onclick: 'closeAlert(this);') + message, class: "alert alert-#{type}")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end

  def show_cart_items

  end
end
