class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :order_cost, :precision => 11, :scale => 2

      t.timestamps
    end
  end
end
