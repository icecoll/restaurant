class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_food(food_id)
    current_item = line_items.find_by_food_id(food_id)
    if current_item
      current_item.quantity +=1
    else
      current_item = line_items.build(:food_id => food_id)
    end
    current_item
  end

  def revomve_food(food_id)
   current_item = line_items.find_by_food_id(food_id)
   if current_item
       line_items.destroy(current_item)
       current_item.quantity -=1
   end
   current_item
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end

  def total_item_count
    line_items.to_a.sum {|item| item.quantity}
  end
end
