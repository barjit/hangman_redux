class RandomWordGenerator
  attr_reader :secret_word

  def generate_secret_word(words)
    @secret_word = words.select do |word|
      word if word.length > 5 && word.length < 12
    end
    @secret_word.sample
  end
end
