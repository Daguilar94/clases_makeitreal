rails d model Product -- Destruir el modelo

rails new name -d postgresql --Xrear un nuevo proyecto con postgres como base de datos por defecto

rails g migration AddPriceToProducts price:integer
rails db:migrate

rails d migration AddPriceToProducts
rails db:migrate

rails g migration RemoveQuantityFromProducts quantity -- Elimina la columna quantity

reils db:migrate:status

rails db:rollback -- se devuelve a como estaba antes de la migracion

product.all.map(&:name)

rails generate migration RenamePriceToProducts price:integer

y en las migraciones hacer lo siguiente:

class RenamePriceToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :price, :price_usd
  end
end

Para devolverse sin rollback

class RenamePriceToProducts < ActiveRecord::Migration[5.1]
  def change
    reversible do |mig|
    mig.up do
      change_column :products, :price_usd, :string
      Product.all.each do |product|
        product.price_usd = product.price_usd.to_s
        product.save
      end
    end

    mig.down do |variable|
    change_column :products, :price_usd, 'integer USING CAST'
  end
end
