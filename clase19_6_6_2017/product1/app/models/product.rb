class Product < ApplicationRecord
  has_many :orders_products
  has_many :orders, through: :orders_products

  validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  scope :in_inventory, -> { where('quantity > :qty', qty: 0)}
  scope :not_expired, -> { where expired: false}
  scope :order_price, -> {order :price}

  #default scope :in_inventory, -> {where('quantity <¡> :qty', qty: 0)} --> se ejecuta en todos los querys. Es util pero peligrosos
  def self.not_expired_in_inventory
    in_inventory.not_expired
  end
end
