class AddTableToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :table_no, :string
  end
end
