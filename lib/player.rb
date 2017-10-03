# The player class keeps track of the players guess_history and turns. It
# also checks if the game's winning conditions have been met. Also checks
# if player would like to load a previous game.
class Player
  attr_accessor :guess_history, :turns

  def initialize
    @guess_history = []
    @turns = 10
  end

  def winning_conditions_met?(secret_word, revealed_word)
    secret_word.split('') == revealed_word
  end

  def request_previous_game?
    puts 'Would you like to load a previous game? (type "yes" or "no")'
    case gets.chomp
    when 'yes'
      true
    when 'no'
      false
    else
      raise RuntimeError
    end
  rescue RuntimeError
    retry
  end
end
