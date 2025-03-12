module Mongo
  class Folder
    include Mongoid::Document
    include Mongoid::Timestamps

    validates :name, presence: true
    validates :name, uniqueness: true
  end
end
