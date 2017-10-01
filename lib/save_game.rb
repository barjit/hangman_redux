# Save Game class. This class accepts variables that keep track of the
# games variables that hold the game's current state and stores them
# in a yaml file.
class SaveGame
  attr_accessor :secret_word, :revealed_word, :guess_history, :turns

  def initialize(secret_word, revealed_word, guess_history, turns)
    @secret_word   = secret_word
    @revealed_word = revealed_word
    @guess_history = guess_history
    @turns         = turns
  end

  def call
    Dir.mkdir('saved_games') unless Dir.exist? 'saved_games'

    puts 'what would you like to call this saved game?'
    filename = "saved_games/#{gets.strip}.yaml"

    File.open(filename, 'w') do |file|
      print '\n'
      file.puts to_yaml
      puts "#{filename} has been saved!"
    end
  end
end
