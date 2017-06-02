class Product < ApplicationRecord
  def self.to_mayus
    self.upcase
  end
end
