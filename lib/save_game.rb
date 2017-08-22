class SaveGame

  attr_accessor :secret_word, :revealed_word, :guess_history, :turns

  def initialize(secret_word, revealed_word, guess_history, turns)
    @secret_word   = secret_word
    @revealed_word = revealed_word
    @guess_history = guess_history
    @turns         = turns
  end

  def call
    Dir.mkdir("saved_games") unless Dir.exists? "saved_games"

    puts "what would you like to call this saved game?"
    filename = "saved_games/#{gets.strip}.yaml"

    File.open(filename, 'w') do |file|
      print "\n"
      file.puts self.to_yaml
      puts "#{filename} has been saved!"
    end
  end

end
