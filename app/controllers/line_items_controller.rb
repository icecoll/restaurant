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

  private

    def line_item_params
      params.require(:line_item).permit(:food_id, :cart_id)
    end
end

