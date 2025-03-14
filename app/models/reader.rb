class Reader < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :liked_books, through: :book_likes, source: :book
end
