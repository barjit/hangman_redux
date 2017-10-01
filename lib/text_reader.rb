# Text reader, the purpose of this class is to accept a text file
# and convert it into an array.
class TextReader
  attr_reader :words_array

  def initialize(filename)
    @words_array = File.readlines(filename).collect(&:strip).collect(&:downcase)
  end
end
