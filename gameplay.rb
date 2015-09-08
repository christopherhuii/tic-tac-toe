require_relative 'board.rb'
require_relative 'user.rb'
require_relative 'computer.rb'

class GamePlay

  def initialize
    system("clear")
  end

  def play
    instructions
    @user = User.new("x")
    @computer = Computer.new("o")
    start_game
  end

  def instructions
    puts "Welcome to Command Line Tic Tac Toe"
    puts "Your Opponent is a remarkably smart AI"
    puts "The order of who goes first will be randomly determined"
    puts "The square spaces on the board are the same as a phone keyboard"
    puts "Type 'start' when you understand the intructions and you are ready to play"
    @word_check = gets.chomp.downcase
    check_read_instructions

  end

  def check_read_instructions
    @password = 'start'
    until @password == @word_check
      puts "Invalid input: Please type 'start' in order to demonstrate you understand the directions"
      @word_check = gets.chomp.downcase
    end
  end

  def start_game
    puts "Welcome #{@user.name}"
    @game_board = Board.new
    @game_board.show_board
    random_turn_generator
  end

  def random_turn_generator

    # Basic way to determine who goes first
    @dice = [0,1].sample
    @total_moves = 0

    until @total_moves >= 9
      case @dice
      when 0
        user_turn
        check_winner(@user)
        @total_moves += 1
      when 1
        computer_turn
        check_winner(@computer)
        @total_moves += 1
      end
    end
  end

  def user_turn

    puts "Enter tile space number for move"
    @cell_move = gets.chomp.to_i
    if valid_placement
      insert_player_symbol(@user)
    else
      until valid_placement
        puts "Please enter a valid move"
        @cell_move = gets.chomp.to_i
      end
      insert_player_symbol(@user)
    end
    @user.moves << @cell_move
    @game_board.refresh_board
    @dice += 1
  end

  def computer_turn
    @cell_move = rand(1..9)
    if valid_placement
      insert_player_symbol(@computer)
    else
      until valid_placement
        @cell_move = rand(1..9)
      end
      insert_player_symbol(@computer)
    end
    @computer.moves << @cell_move
    @game_board.refresh_board
    @dice -= 1
  end

  def valid_placement
    @game_board.board[@cell_move] == @cell_move
  end

  def insert_player_symbol(player)
    @game_board.board[@cell_move] = player.symbol
  end

  def check_winner(player)
    @winning_combinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

    if (player.moves.permutation(3).to_a & @winning_combinations).length > 0
      puts "#{player.name} WINS!"
      exit
    end
  end
end

@game = GamePlay.new
@game.play
