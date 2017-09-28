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
    begin
      puts 'Would you like to load a previous game? (yes/no)'
      choice = gets.chomp
      case choice
      when 'yes'
        true
      when 'no'
        false
      else
        puts 'Please type \'yes\' or \'no\'.'
        raise
      end
    rescue
      retry
    end
  end
end
