class AddStateToAdress < ActiveRecord::Migration[5.1]
  def change
    add_column :adresses, :state, :string
  end
end
