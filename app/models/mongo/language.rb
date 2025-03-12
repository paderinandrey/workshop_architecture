module Mongo
  class Language
    include Mongoid::Document
    include Mongoid::Timestamps

    validates :slug, presence: true
    validates :slug, uniqueness: true
  end
end
