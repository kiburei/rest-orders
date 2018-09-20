class AddMenuToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :menu, foreign_key: true
  end
end
