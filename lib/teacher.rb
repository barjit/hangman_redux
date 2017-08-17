class Teacher
  def reveal_correct_guess(secret_word,revealed_word,user_input,guess_history)
    @index = 0
    secret_word.split("").each do |letter|
      if letter == user_input
        revealed_word[@index] = letter
        unless guess_history.include? user_input
          guess_history << user_input
        end
      end
      @index += 1
    end
    revealed_word
  end
end
