class Category
  CATEGORIES = [:word_processor, :spreadsheet]

  attr_reader :name

  def initialize(name:)
    raise ArgumentError unless CATEGORIES.include?(name)
    @name = name
  end
end
