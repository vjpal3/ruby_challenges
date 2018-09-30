class Board

  def initialize
    @board = []
    10.times do
      row = []
      10.times do
        row << BoardSpace.new
      end
      @board << row
    end
  end

  def rows
    @board
  end

  def print_board
    puts
    @board.each do |row|
      print "|"
      row.each do |space|
        print " #{space.to_char} "
      end
      puts "|"
    end
    puts
  end

  def empty_spaces?
    @board.each do |row|
      row.each do |space|
        return true if !space.occupied?
      end
    end
    return false
  end

  def get_row(col_index)
    @board.each_with_index do |row, index|
      if !row[col_index].occupied?
        return index
      end
    end
    return -1
  end

  def add_turn(player, row_index, col_index)
    @last_turn = GameTurn.new(self, player, row_index, col_index)
    @last_turn.take!
  end

  def winner?
    if @last_turn
      @last_turn.winner?
    else
      false
    end
  end
end
