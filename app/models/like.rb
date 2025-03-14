class Like < ApplicationRecord
  belongs_to :reader
  belongs_to :book

  validates :reader_id, uniqueness: { scope: :book_id, message: "уже поставил лайк этой книге" }
end
