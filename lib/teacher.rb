class Teacher
  def reveal_correct_guess(secret_word,revealed_word,user_input,guess_history)
    @index = 0
    secret_word.split("").map do |letter|
      if letter == user_input
        revealed_word[@index] = letter
      end
      @index += 1
    end
    store_history(guess_history, user_input)
  end

  def store_history(guess_history, user_input)
    unless guess_history.include? user_input
      guess_history << user_input
    end
  end
end
