require 'minitest/autorun'
require_relative '../lib/teacher'

class TeacherTest < Minitest::Test

  def setup
    @teacher = Teacher.new
    @secret_word = "poppongene"
    @revealed_word = Array.new(@secret_word.length) { "_" }
    @user_input = "p"
  end

  def test_reveal_correct_guess_reveals_all_correct_letters
    @letter_index = @teacher.find_matching_letters(@secret_word, @user_input)
    assert_equal %w{p _ p p _ _ _ _ _ _}, @teacher.reveal_matching_letters(@letter_index, @revealed_word, @user_input)
  end
  
end