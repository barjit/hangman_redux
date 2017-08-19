require_relative './save_game'

class Computer
  attr_accessor :user_input

  def get_input
    @user_input = ""
    until valid?(@user_input)
      puts "Type 'quit', 'save' or any letter to play on: "
      @user_input = gets.chomp.downcase
      save_quit_or_play(@user_input)
    end
    @user_input
  end

  def valid?(user_input)
    valid_answers = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z
                      save quit}
    if valid_answers.include? user_input
      true
    else
      false
    end
  end

  def save_quit_or_play(user_input)
    case user_input
    when "save"
      SaveGame.call
    when "quit"
      puts "Quitting game, bye!"
      exit
    else
      user_input
    end
  end

  def welcome_message
    puts " ------------------------------------------------------------------- "
    puts " Welcome to Hangman, try to guess the mystery word before your turns "
    puts " run out. "
    puts " ------------------------------------------------------------------- "
  end

  def game_over_loser_message
    "You're out of turns, you lose."
  end

  def game_over_winner_message
    "That's right, you win!"
  end
end
