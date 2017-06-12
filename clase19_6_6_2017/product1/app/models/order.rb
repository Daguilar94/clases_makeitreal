class Order < ApplicationRecord
  has_many :orders_products
  has_many :products, through: :orders_products
  belongs_to :user

  scope :with_products, -> (id){
    includes(:products).find(id)
  }
  scope :with_products_n_1, -> () {
    all.each do |order|
      order.products.each do |product|
        puts "PRODUCT= #{product.sku}"
      end
    end
  }
end
