class RenameColIds < ActiveRecord::Migration[5.2]
  def change
    rename_column :menus, :id, :menu_id
    rename_column :orders, :id, :order_id
    rename_column :transactions, :id, :transaction_id
  end
end
