# frozen_string_literal: true

class BookSerializer
  include ::Alba::Resource

  attributes :id, :title, :created_at, :updated_at, :series, :serno, :libid, :size, :filename,
             :del, :ext, :published_at, :insno

  attribute :folder do |book|
    book.folder.try(:name) if book.folder
  end
end
