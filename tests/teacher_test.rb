require 'minitest/autorun'
require_relative '../lib/teacher'

class TeacherTest < Minitest::Test

  def setup
    @teacher = Teacher.new
    @secret_word = "poppongene"
    @revealed_word = Array.new(@secret_word.length) { "_" }
    @user_input = "p"
    @guess_history = []
  end

  def test_store_history
    assert_equal %w{ p }, @teacher.store_history(@guess_history, @user_input)
  end

  # def test_reveal_correct_guess_reveals_all_correct_letters
  #   assert_equal %w{p _ p p _ _ _ _ _ _}, @teacher.reveal_correct_guess(@secret_word, @revealed_word, @user_input, @guess_history)
  # end

end
