class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.references :menu, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
