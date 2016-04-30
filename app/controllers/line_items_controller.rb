class LineItemsController < InheritedResources::Base

  def create
    @cart = current_cart
    food = Food.find(params[:food_id])
    @line_item = @cart.line_items.build(:food => food)

    respond_to do |format|
      if @line_item.save
        format.html{redirect_to @cart}
        format.xml {render :xml => @line_item,
          :status => :created,:location => @line_item}
      else
        format.html{render :action => 'new'}
        format.xml {render :xml =>@line_item.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  private

    def line_item_params
      params.require(:line_item).permit(:food_id, :cart_id)
    end
end

