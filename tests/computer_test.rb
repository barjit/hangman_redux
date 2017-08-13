require 'minitest/autorun'
require_relative '../lib/computer'

class ComputerTest < Minitest::Test
  def setup
    @computer = Computer.new
    @non_valid_array = ["pop", 32, 12, "^*4", "twelve"]
    @valid_array = ["a", "g", "p", "o", "g", "w", "f", "T", "L", "n", "Q"]
  end

  def test_user_input_valid
    @computer.user_input = @valid_array.sample
    assert @computer.valid?(@computer.user_input)
  end

  def test_user_input_not_valid
    @computer.user_input = @non_valid_array.sample
    refute @computer.valid?(@computer.user_input)
  end
end
