class User < ApplicationRecord
  has_many :orders
  has_many :adresses

  validates :email, uniqueness: {message: 'parce este %{attribute} %{value} ya existe'}
  validates :username, uniqueness: {message: 'parce este %{attribute} %{value} ya existe'}, length: {in: 5..20}
  validates :password, length: {in: 8..16}
end
