class Blackboard
  attr_accessor :revealed_word

  def initialize(secret_word)
    @revealed_word = Array.new(secret_word.length) { "_" }
  end

  def show_revealed_word(revealed_word)
    revealed_word.each do |letter|
      print letter + " "
    end
    print "\n"
  end
end
