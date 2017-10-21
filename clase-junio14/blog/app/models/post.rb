class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :content, length: {in: 1..140}, presence: true
  validates :title, length: {in: 1..100}


end
