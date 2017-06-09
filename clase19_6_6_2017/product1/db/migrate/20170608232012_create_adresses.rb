class CreateAdresses < ActiveRecord::Migration[5.1]
  def change
    create_table :adresses do |t|
      t.string :country
      t.string :city
      t.integer :zip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
