class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :item_name
      t.decimal :item_cost, :precision => 11, :scale => 2

      t.timestamps
    end
  end
end
