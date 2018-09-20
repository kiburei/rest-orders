class AddOrderToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :order, foreign_key: true
  end
end
