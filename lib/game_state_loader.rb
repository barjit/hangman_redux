class GameStateLoader
  attr_accessor :secret_word, :revealed_word, :guess_history, :turns
  
  def self.call(filename)
    saved = YAML.load(filename)
    @secret_word = saved.secret_word
    @revealed_word = saved.revealed_word
    @guess_history = saved.guess_history
    @turns = saved.turns
  end
  
end
