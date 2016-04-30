class RenameColumnFromProductIdToFoodIdInTableLineItem < ActiveRecord::Migration
  def change
    rename_column :line_items,:product_id,:food_id
  end
end
