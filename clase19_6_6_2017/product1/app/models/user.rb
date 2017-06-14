class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :adresses
  has_many :invoices

  validates :email, uniqueness: {message: 'parce este %{attribute} %{value} ya existe'}
  validates :username, uniqueness: {message: 'parce este %{attribute} %{value} ya existe'}, length: {in: 5..20}
  validates :password, length: {in: 8..16}

  before_validation :sanitize
  before_create :indicate

  private
  def sanitize
    email.downcase!
    username.downcase!
  end
  def indicate
    puts 'Creating user'
  end
end
