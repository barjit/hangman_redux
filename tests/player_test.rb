require 'minitest/autorun'
require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
    @secret_word = "poppongene"
    @correct_array = %w{p o p p o n g e n e}
    @incomplete_array = ["p", "_", "p", "p", "_", "_", "_", "_", "_", "_"]
    @incorrect_data = 23
  end

  def test_winning_conditions_true_if_arrays_identical
    assert @player.winning_conditions_met?(@secret_word, @correct_array)
  end

  def test_winning_conditions_false_if_arrays_dont_match
    refute @player.winning_conditions_met?(@secret_word, @incomplete_array)
  end

  def test_winning_conditions_false_if_incorrect_data_supplied
    refute @player.winning_conditions_met?(@secret_word, @incorrect_data)
  end
end