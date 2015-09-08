
class User

  attr_reader :name, :symbol
  attr_accessor :moves
  def initialize(symbol)
    get_name
    @symbol = symbol
    @moves = []
  end
  def get_name
    puts "Please enter your name"
    @name = gets.chomp

    until @name.length >= 1
      puts "Please a name greater than 0 characters"
      @name = gets.chomp
    end
  end
end