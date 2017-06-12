class OrdersProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  scope :with_multiple_products, -> (number = 1){
    select('distinct(order_id)')
    #where('count(product_id) >= number', number: number)
    group(:order_id, :product_id)
    .having('count(product_id) >= :number', number: number)
    .includes :order
  }
end
