require 'minitest/autorun'
require_relative '../lib/teacher'

# Teacher test
class TeacherTest < Minitest::Test
  def setup
    @teacher = Teacher.new
    @secret_word = 'poppongene'
    @revealed_word = Array.new(@secret_word.length) { '_' }
    @user_input = 'p'
    @guess_history = []
  end

  def test_store_history
    assert_equal %w[p], @teacher.store_history(@guess_history, @user_input)
  end
end
