require 'minitest/autorun'
require_relative '../lib/random_word_generator'
require_relative '../lib/text_reader'

# RandomWordGenerator test
class RandomWordGeneratorTest < Minitest::Test
  def setup
    filename = '5desk.txt'
    @text_reader = TextReader.new
    @random_word_generator = RandomWordGenerator.new
    @text_reader.read(filename)
  end

  def test_random_word_generator_returns_a_random_word_of_correct_length
    20.times do
      assert @random_word_generator.generate_secret_word(@text_reader.words)
        .length.between?(5, 12)
    end
  end
end
