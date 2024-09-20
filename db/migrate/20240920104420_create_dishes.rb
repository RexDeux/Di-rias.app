class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.references :menu_ids, polymorphic: true, null: false
      t.float :price

      t.timestamps
    end
  end
end
