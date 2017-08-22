class Blackboard
  attr_accessor :revealed_word

  def initialize(secret_word)
    @revealed_word = Array.new(secret_word.length) { "_" }
  end

  def show_revealed_word(revealed_word, guess_history, turns)
    print_line
    puts
    revealed_word.each do |letter|
      print letter + " "
    end
    print_line
    show_guess_history(guess_history)
    print "\n"
    show_turns_left(turns)
  end

  def show_guess_history(guess_history)
    print "\t\t Guess History: #{guess_history}"
  end

  def show_turns_left(turns)
    puts
    puts "You have #{turns} turns left."
    puts
  end

  def print_line
    puts
    puts "____________________________________________"
  end
end
