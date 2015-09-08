class Computer
  attr_reader :name, :symbol
  attr_accessor :moves

  def initialize(symbol)
    @name = "Computer"
    @symbol = symbol
    @moves = []
  end


end