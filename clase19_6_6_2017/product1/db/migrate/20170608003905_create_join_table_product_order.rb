class CreateJoinTableProductOrder < ActiveRecord::Migration[5.1]
  def change
    create_join_table :products, :orders do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end
