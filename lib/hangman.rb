require_relative './text_reader'
require_relative './random_word_generator'
require_relative './blackboard'
require_relative './teacher'
require_relative './computer'
require_relative './player'

class Hangman
  def self.start
    @text_reader = TextReader.new('5desk.txt')
    @generated = RandomWordGenerator.new(@text_reader.words_array)
    @blackboard = Blackboard.new(@generated.secret_word)
    @teacher = Teacher.new
    @computer = Computer.new
    @player = Player.new

    puts @computer.welcome_message

    if @player.load_previous_game?
      GameStateLoader.call
      @generated.secret_word             = GameStateLoader.secret_word
      @blackboard.revealed_word          = GameStateLoader.revealed_word
      @player.guess_history              = GameStateLoader.guess_history
      @player.turns                      = GameStateLoader.turns
    end

    until @player.turns == 0
      @blackboard.show_revealed_word(@blackboard.revealed_word)
      @computer.get_input
      @teacher.reveal_correct_guess(@generated.secret_word, @blackboard.revealed_word, @computer.user_input, @player.guess_history)
      if @player.winning_conditions_met?(@generated.secret_word, @blackboard.revealed_word)
        puts @computer.game_over_winner_message
        exit
      end
      @player.turns -= 1
    end
    puts @computer.game_over_loser_message
  end

  # def self.set_variables(secret_word, revealed_word, user_input)
  # end
end

Hangman.start
