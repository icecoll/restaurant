class ChangeColumnStatusInOrderAddDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :orders, :status, '已下单'
  end
end
