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
end
