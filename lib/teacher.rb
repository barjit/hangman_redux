class Teacher
  attr_accessor :nod

  def reveal_correct_guess(secret_word,revealed_word,user_input,guess_history)
    @index = 0
    @nod = false
    secret_word.split("").map do |letter|
      if confirmed_correct_guess?(letter, user_input)
        revealed_word[@index] = letter
        @nod = true
      elsif guess_history.include? user_input
        @nod = true
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

  def confirmed_correct_guess?(letter, user_input)
    true unless letter != user_input
  end
end
