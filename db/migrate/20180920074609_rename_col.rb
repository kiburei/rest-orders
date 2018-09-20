class RenameCol < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :id, :order_items_id
  end
end
