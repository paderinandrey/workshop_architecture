module Mongo
  class Book
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title, type: String
    field :series, type: String
    field :serno, type: String
    field :libid, type: Integer
    field :size, type: Integer
    field :filename, type: Integer
    field :del, type: Boolean
    field :ext, type: String
    field :published_at, type: Date
    field :insno, type: String

    has_and_belongs_to_many :authors
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :keywords

    belongs_to :folder, optional: true, class_name: 'Mongo::Folder'
    belongs_to :language, optional: true, class_name: 'Mongo::Language'

    PUBLIC_FIELDS = %w[del ext filename folder_id insno language_id
                      libid series serno size title published_at
                      updated_at created_at].freeze
  end
end
