class CreateGroceries < ActiveRecord::Migration[7.0]
  def change
    create_table :groceries do |t|
      t.string :name
      t.integer :quantity
      t.string :category
      t.boolean :completed

      t.timestamps
    end
  end
end
