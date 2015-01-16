class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :actable_id
      t.string :actable_type

      t.timestamps
    end
  end
end
