class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.integer :shelf_life

      t.timestamps
    end
  end
end
