class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :sku
      t.integer :quantity
      t.text :name

      t.timestamps
    end
  end
end
