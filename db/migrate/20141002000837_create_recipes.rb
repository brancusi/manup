class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :instructions

      t.timestamps
    end
  end
end
