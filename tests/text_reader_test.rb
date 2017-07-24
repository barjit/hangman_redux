require 'minitest/autorun'
require_relative '../lib/text_reader'

class TextReaderTest < Minitest::Test
  def setup
    @text_reader = TextReader.new
    @filename = '5desk.txt'
    @text_reader.read(@filename)
  end

  def test_that_read_method_converts_supplied_text_to_array
    assert @text_reader.words.is_a? Array
  end
    
end