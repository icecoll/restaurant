class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.decimal :price
      t.string :image
      t.text :description
      t.timestamps null: false
    end
  end
  #TODO:alter the price column to t.decimal :price , precision: 8, scale: 2
end
