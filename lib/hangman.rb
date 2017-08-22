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
@generated = RandomWordGenerator.new(@text_reader.words_array)
@blackboard = Blackboard.new(@generated.secret_word)
@teacher = Teacher.new
@computer = Computer.new
@player = Player.new

class Hangman
  def self.start(generated, blackboard, teacher, computer, player)
    puts computer.welcome_message

    if player.request_previous_game?
      Hangman.load_game
    else
      Hangman.new_game(generated.secret_word, blackboard.revealed_word,
                      player.guess_history, player.turns)
    end

    until @turns == 0
      @saved_game = SaveGame.new(@secret_word, @revealed_word, @guess_history,
                                @turns)

      blackboard.show_revealed_word(@revealed_word, @guess_history)
      computer.get_input(@saved_game)
      @user_input = computer.user_input

      teacher.reveal_correct_guess(@secret_word, @revealed_word, @user_input,
                                  @guess_history)

      if player.winning_conditions_met?(@secret_word, @revealed_word)
        puts computer.game_over_winner_message
        exit
      end

      @turns -= 1
    end
    puts computer.game_over_loser_message
  end

  def self.load_game
    puts "which game would you like to load?"
    puts "(don't worry about typing the yaml extention)"
    saved_games = Dir.glob("./saved_games/*.yaml")
    saved_games.each { |game| puts game.sub("./saved_games/", "") }
    filename = "./saved_games/#{gets.strip}.yaml"
    saved_game = YAML::load(File.open(filename))

    @secret_word = saved_game.secret_word
    @revealed_word = saved_game.revealed_word
    @guess_history = saved_game.guess_history
    @turns = saved_game.turns
  end

  def self.new_game(secret_word, revealed_word, guess_history, turns)
    @secret_word = secret_word
    @revealed_word = revealed_word
    @guess_history = guess_history
    @turns = turns
  end
end

Hangman.start(@generated, @blackboard, @teacher, @computer, @player)
