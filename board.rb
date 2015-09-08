class Board
  attr_accessor :board

  def initialize
    @board = [0,1,2,3,4,5,6,7,8,9]
  end

  def show_board
    puts " #{@board[1]} | #{@board[2]} | #{@board[3]} "
    puts "-----------"
    puts " #{@board[4]} | #{@board[5]} | #{@board[6]} "
    puts "-----------"
    puts " #{@board[7]} | #{@board[8]} | #{@board[9]} "
  end

  def refresh_board
    system("clear")
    show_board
  end
end


