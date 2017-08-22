class Blackboard
  attr_accessor :revealed_word

  def initialize(secret_word)
    @revealed_word = Array.new(secret_word.length) { "_" }
  end

  def show_revealed_word(revealed_word, guess_history)
    revealed_word.each do |letter|
      print letter + " "
    end
    show_guess_history(guess_history)
    print "\n"
  end

  def show_guess_history(guess_history)
    print "\t\t Guess History: #{guess_history}"
  end

end
