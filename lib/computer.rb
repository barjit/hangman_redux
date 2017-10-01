require_relative './save_game'

# This class represents the computer in that it retrieves input, validates it
# and provides
# the player with prompts, options and information about their winning or
# losing.
class Computer
  attr_accessor :user_input

  def get_input(saved_game)
    @user_input = ''
    begin
      puts 'Please type your guess: '
      @user_input = gets.chomp.downcase
      if valid?(@user_input)
        save_quit_or_play(@user_input, saved_game)
      else
        puts "Type 'quit' or 'save' otherwise type a single letter!"
        raise
      end
    rescue
      retry
    end
  end

  def valid?(user_input)
    valid_answers =
      %w[a b c d e f g h i j k l m n o p q r s t u v w x y z save quit]
    if valid_answers.include? user_input
      true
    else
      false
    end
  end

  def save_quit_or_play(user_input, saved_game)
    case user_input
    when 'save'
      saved_game.call
    when 'quit'
      puts 'Quitting game, bye!'
      exit
    else
      user_input
    end
  end

  def welcome_message
    puts ' ------------------------------------------------------------------- '
    puts ' Welcome to Hangman, try to guess the mystery word before your turns '
    puts ' run out. '
    puts ' ------------------------------------------------------------------- '
  end

  def game_over_loser_message(secret_word)
    "You're out of turns, you lose. The correct word was #{secret_word}."
  end

  def game_over_winner_message(secret_word)
    "That's right, you win! The correct word was #{secret_word}."
  end
end
