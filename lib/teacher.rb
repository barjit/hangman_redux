class Teacher
  def reveal_correct_guess(secret_word, revealed_word, user_input)
    @index = 0
    secret_word.split("").each do |letter|
      if letter == user_input
        revealed_word[@index] = letter
      end
      @index += 1
    end
    revealed_word
  end
end
