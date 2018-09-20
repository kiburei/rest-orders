class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :transaction_amount, :precision => 11, :scale => 2
      t.string :transaction_channel

      t.timestamps
    end
  end
end
