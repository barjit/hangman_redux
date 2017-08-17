class TextReader
  attr_reader :words_array

  def initialize(filename)
    @words_array = File.readlines(filename).collect(&:strip).collect(&:downcase)
  end
end
