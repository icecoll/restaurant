class RenameTableMenuToFood < ActiveRecord::Migration
  def change
    rename_table :menus, :foods
  end
end
