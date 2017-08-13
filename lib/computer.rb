class Computer
  attr_accessor :user_input

  def get_input
    until valid?(user_input)
      puts "Please enter a valid guess: "
      @user_input = gets.chomp
    end
    @user_input
  end

  def valid?(user_input)
    alphabet = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z
                  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}
    if alphabet.include? user_input
      true
    else
      false
    end
  end
end
