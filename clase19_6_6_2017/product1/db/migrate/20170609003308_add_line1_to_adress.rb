class AddLine1ToAdress < ActiveRecord::Migration[5.1]
  def change
    add_column :adresses, :line1, :string
  end
end
