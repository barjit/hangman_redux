require 'minitest/autorun'
require_relative '../lib/blackboard'

# Blackboard test
class BlackboardTest < Minitest::Test
  def setup
    @blackboard = Blackboard.new('poppongene')
  end

  def test_revealed_word_is_array
    assert_kind_of Array, @blackboard.revealed_word
  end

  def test_revealed_is_not_empty
    refute_empty @blackboard.revealed_word
  end
end
