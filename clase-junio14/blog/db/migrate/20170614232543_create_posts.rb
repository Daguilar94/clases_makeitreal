class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null:false, limit: 100
      t.string :content, null:false, limit:140
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
