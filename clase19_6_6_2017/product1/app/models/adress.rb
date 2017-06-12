class Adress < ApplicationRecord
  belongs_to :user
  #validates :line1, length: {in 0..50}
  validates :state, presence: true, if: :us?
  validates :country, inclusion: {in: %w(co us)}

  def us?
    country == 'us'
  end
end
