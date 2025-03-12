class Seeds::Mongo::LanguageLoad
  include Callable
  extend Dry::Initializer

  option :filename, type: Dry::Types['strict.string']

  def call
    Mongo::Language.delete_all
    Mongo::Language.collection.insert_many seeds_from_yaml(filename)
  end

  def seeds_from_yaml(file)
    YAML.load_file(Rails.root.join(file))['items'] || []
  end
end
