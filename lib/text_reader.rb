class TextReader

  attr_reader :words

  def initialize
    @words = []
  end

  def read(filename)
    @words << File.readlines(filename).collect(&:strip).collect(&:downcase)
  end

end
