class TicTacToe
  attr_accessor :p1, :p2, :board
  @@initiative = 1
  
  def initialize
    @p1 = Player.new("X")
    @p2 = Player.new("O")
    @board = GameBoard.new
  end

  def players
    puts p1.player
    puts p2.player
  end

  def player_turn_handler
    if @@initiative == 1
      puts "player #{p1.player}'s turn"
      puts "pick your move from 1-9"
      input = gets.to_i
      if board.a[input] == p1.player_mark
        puts "you already played here"
      else
        @@initiative = 0
        board.a[input] = p1.player_mark
        board.Draw
      end

    else
      puts "player #{p2.player}'s turn"
      puts "pick your move from 1-9"
      input = gets.to_i
      if board.a[input] == p2.player_mark
        puts "you already played here"
      else
        @@initiative = 1
        board.a[input] = p2.player_mark
        board.Draw
      end

    end
  end
end

class GameBoard
  attr_accessor :a
  @@winning = [[1,2,3], [3,4,6], [7,8,9],
              [1,5,9], [3,5,7], [1,4,7],
              [3,6,9], [2,5,8]]
  def initialize
    @a = Array.new(10,"?")
    self.Draw
  end

  def Draw()
    puts "#{a[1]}|#{a[2]}|#{a[3]}"
    puts "-+-+-"
    puts "#{a[4]}|#{a[5]}|#{a[6]}"
    puts "-+-+-"
    puts "#{a[7]}|#{a[8]}|#{a[9]}"
  end

  def win_condition?(player)
    @@winning.each do |w|
      return true if w.all? { |n| a[n] == player.player_mark }
    end
    return false
  end
end

class Player
  attr_reader :player
  @@number = 1

  def initialize(a)
    puts "Welcome to TicTacToe player #{@@number}!"
    puts "you will be '#{a}'"
    @player = a
    @@number += 1
  end

  def player_mark
    @player
  end
end

game = TicTacToe.new
#game.players
#game.player_turn
game_over = false

while !game_over
  game.player_turn_handler
  if (game.board.win_condition?(game.p1))
    puts "Player #{game.p1.player_mark} wins!"
    game_over = true
  elsif game.board.win_condition?(game.p2)
    puts "Player #{game.p2.player_mark} wins!"
    game_over = true
  end
end
