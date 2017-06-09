class Adress < ApplicationRecord
  belongs_to :user

  validates :line1, length: {in 0..50}
end
