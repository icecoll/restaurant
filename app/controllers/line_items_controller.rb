class LineItemsController < InheritedResources::Base

  def create_line_item
    @cart = current_cart
    @line_item = @cart.add_food(params[:food_id])
    render json: {code: 0}
    # respond_to do |format|
    #   if @line_item.save
    #     format.html{redirect_to delivery_index_path}
    #     format.json
    #   else
    #     format.html{render :action => 'new'}
    #     format.xml {render :xml =>@line_item.errors,
    #       :status => :unprocessable_entity }
    #   end
    # end
  end

  def line_item_count_plus
     cart = current_cart
     line_item = current_cart.line_items.find(params[:line_item_id])
     if line_item
         line_item.quantity +=1;
         if line_item.update(quantity:line_item.quantity)
            render json: {state_code:1,
                          total_line_item_count: cart.total_item_count,
                          current_line_item_count: line_item.quantity,
                          line_item_total_price: line_item.total_price,
                          cart_total_price: cart.total_price
                        }
         end
     else
        render json: {state_code:0}
     end
  end

  def line_item_count_minus
      cart = current_cart
      line_item = current_cart.line_items.find(params[:line_item_id])
      if line_item && line_item.quantity>0
        line_item.quantity-=1;
        if(line_item.quantity == 0)
            line_item.destroy
            render json: {state_code:1,
                          total_line_item_count: cart.total_item_count,
                          current_line_item_count: 0,
                          cart_total_price: cart.total_price}
            return
        else
            line_item.update(quantity: line_item.quantity)
        end
        render json: {state_code:1,
                      total_line_item_count: cart.total_item_count,
                      current_line_item_count: line_item.quantity,
                      line_item_total_price: line_item.total_price,
                      cart_total_price: cart.total_price}
        return
      else
        render json: {state_code:0}
      end
  end

  private

    def line_item_params
      params.require(:line_item).permit(:food_id, :cart_id)
    end
end

