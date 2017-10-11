require 'yaml'
require_relative './text_reader'
require_relative './random_word_generator'
require_relative './blackboard'
require_relative './teacher'
require_relative './computer'
require_relative './player'
require_relative './load_game'
require_relative './save_game'

@text_reader = TextReader.new('5desk.txt')
@generated   = RandomWordGenerator.new(@text_reader.words_array)
@blackboard  = Blackboard.new(@generated.secret_word)
@teacher     = Teacher.new
@computer    = Computer.new
@player      = Player.new

# This is the 'driver' class
class Hangman
  def play(generated, blackboard, teacher, computer, player)
    puts computer.welcome_message

    if player.request_previous_game?
      assign_game_variables(LoadGame.call)
    else
      new_game(generated.secret_word, blackboard.revealed_word,
               player.guess_history, player.turns)
    end
    check_turns(blackboard, computer, teacher, player)
    puts computer.game_over_loser_message(@secret_word)
  end

  def check_turns(blackboard, computer, teacher, player)
    until @turns.zero?
      save_current_progress
      blackboard.show_revealed_word(@revealed_word, @guess_history, @turns)
      computer.get_input(@saved_game)
      @user_input = computer.user_input
      show_correct_guess(teacher)
      game_winning_conditions_met(player, computer)
      @turns -= 1 unless teacher.nod
    end
  end

  def save_current_progress
    @saved_game = SaveGame.new(@secret_word, @revealed_word, @guess_history,
                               @turns)
  end

  def show_correct_guess(teacher)
    teacher.reveal_correct_guess(@secret_word, @revealed_word, @user_input,
                                 @guess_history)
  end

  def game_winning_conditions_met(player, computer)
    puts computer.game_over_winner_message(@secret_word) if
    player.winning_conditions_met?(@secret_word, @revealed_word)
  end

  def assign_game_variables(saved_game)
    @secret_word = saved_game.secret_word
    @revealed_word = saved_game.revealed_word
    @guess_history = saved_game.guess_history
    @turns = saved_game.turns
  end

  def new_game(secret_word, revealed_word, guess_history, turns)
    @secret_word = secret_word
    @revealed_word = revealed_word
    @guess_history = guess_history
    @turns = turns
  end
end

game = Hangman.new
game.play(@generated, @blackboard, @teacher, @computer, @player)
