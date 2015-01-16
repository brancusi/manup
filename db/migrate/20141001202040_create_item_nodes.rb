class CreateItemNodes < ActiveRecord::Migration
  def change
    create_table :item_nodes do |t|
      t.integer :parent_id
      t.integer :child_id
      t.decimal :quantity
      t.decimal :shrinkage_ratio
      t.decimal :fixed_loss

      t.timestamps
    end
  end
end
