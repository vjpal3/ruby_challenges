require_relative "board"
require_relative "board_space"
require_relative "player"
require_relative "game_turn"

MAX_ROW = 10
MAX_COL = 10
def validate_name(name, p1_name = "")
  while name == "" || p1_name == name
    print "Please enter your unique name: "
    name = gets.chomp
  end
  name
end

players = []
print "Player 1, please enter your name: "
name = gets.chomp
player1_name = validate_name(name)
players << Player.new(player1_name, 'x')

print "Player 2, please enter your name: "
name = gets.chomp
player2_name = validate_name(name, player1_name)
players << Player.new(player2_name, 'o')

players.shuffle!
turn_index = 0
puts

input = 'y'
while input == 'y'
  board = Board.new
  board.print_board

  while board.empty_spaces? && !board.winner?
    current_player = players[turn_index]
    puts "It is #{current_player.name} turn"

    col_index = -1
    while col_index > MAX_COL || col_index < 1
      print "What column do you want to play?"
      col_index = gets.chomp.to_i
    end
    col_index -= 1

    row_index = -1
    while row_index == -1
      #Check if row is availble for that column
      row_index = board.get_row(col_index)
    end

    board.add_turn(current_player, row_index, col_index)
    board.print_board

    turn_index = turn_index == 0 ? 1 : 0
  end

  if !board.winner?
    puts "Game Draw!!!"
  else
    puts "Game Over: #{current_player.name} Won!!!"
  end

  puts
  print "Do you want to start-over again?(y/n): "
  input = gets.chomp.downcase
end
