# module LoadGame
#   def self.call
#     puts "which game would you like to load?
#     (don't worry about typing the yaml extention)"
#     saved_games = Dir.glob("./saved_games/*.yaml")
#     saved_games.each { |game| puts game.sub("./saved_games/", "") }
#     filename = "./saved_games/#{gets.strip}.yaml"
#     saved_game = YAML::load(File.open(filename))
#
#     @secret_word = saved_game.secret_word
#     @revealed_word = saved_game.revealed_word
#     @guess_history = saved_game.guess_history
#     @turns = saved_game.turns
#   end
#
# end
