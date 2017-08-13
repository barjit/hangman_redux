class Teacher

  attr_accessor :letter_index

  def initialize
    @letter_index = Array.new
  end

  def find_matching_letters(secret_word, user_input)
    @letter_index = secret_word.split("").each_index.select {|letter| secret_word[letter] == user_input}
  end

  def reveal_matching_letters(letter_index, revealed_word, user_input)
    unless letter_index.empty?
      letter_index.each do |index|
        revealed_word[index] = user_input
      end
    end
    revealed_word
  end

end













  # def reveal_correct_guess(secret_word, revealed_word, user_input)
  #   @index = 0
  #   secret_word.split("").each do |letter|
  #     if letter == user_input
  #       revealed_word[@index] = letter
  #     end
  #     @index += 1
  #   end
  #   revealed_word
  # end