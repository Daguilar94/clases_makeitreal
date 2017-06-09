class UpdateUserConstraints < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :password, :string, limit:16, null:false
    change_column :users, :username, :string, limit:20, null:false
  end
  def down
    change_column :users, :password, :string
    change_column :users, :username, :string
  end
end
