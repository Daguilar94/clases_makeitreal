class AddLine2ToAdress < ActiveRecord::Migration[5.1]
  def change
    add_column :adresses, :line2, :string
  end
end
