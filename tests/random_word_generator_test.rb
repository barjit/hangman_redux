require 'minitest/autorun'
require_relative '../lib/random_word_generator'

class RandomWordGeneratorTest < Minitest::Test
  include RandomWordGenerator

  def test_random_word_generator_returns_a_random_word_between_5_and_12_characters_long
    20.times {assert RandomWordGenerator.generate_secret_word(@text_reader.words).length.between?(5, 12)}
  end

end