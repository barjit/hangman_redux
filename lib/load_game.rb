# Module to load games
module LoadGame
  def self.call
    puts 'which game would you like to load?'
    puts '(don\'t worry about typing the yaml extention)'
    saved_games = Dir.glob('./saved_games/*.yaml')
    saved_games.each { |game| puts game.sub('./saved_games/', '') }
    filename = "./saved_games/#{gets.strip}.yaml"
    YAML.safe_load(File.open(filename), [SaveGame])
  end
end
