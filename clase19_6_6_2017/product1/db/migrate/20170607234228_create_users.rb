class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :username
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
