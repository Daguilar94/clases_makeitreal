class Product < ApplicationRecord
  def self.to_minus
   self.downcase
  end
end
