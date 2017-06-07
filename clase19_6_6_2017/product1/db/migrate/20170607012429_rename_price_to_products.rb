class RenamePriceToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :price, :price_usd
  end
end
