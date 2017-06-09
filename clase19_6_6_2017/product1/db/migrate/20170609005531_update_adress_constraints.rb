class UpdateAdressConstraints < ActiveRecord::Migration[5.1]
  def up
    change_column :adresses, :line1, :string, limit: 50, null: false, default: ''
    change_column :adresses, :line2, :string, limit: 50
    change_column :adresses, :country, :string, null: false
    change_column :adresses, :city, :string, null: false
  end
  def down
    change_column :adresses, :line1, :string
    change_column :adresses, :line2, :string
    change_column :adresses, :country, :string
    change_column :adresses, :city, :string
  end
end
