require 'minitest/autorun'
require_relative '../lib/computer'

# Computer test
class ComputerTest < Minitest::Test
  def setup
    @computer = Computer.new
    @non_valid_array = ['pop', 32, 12, '^*4', 'twelve']
    @valid_array = %w[a G s p L F c t w o P]
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
