class GameTurn
  def initialize(board, player, row_index, col_index)
    @board = board
    @player = player
    @row_index = row_index
    @col_index = col_index
  end

  def take!
    @board.rows[@row_index][@col_index].player = @player
  end

  def winner?
    horizontal_win? || vertical_win?
  end

  def horizontal_win?
    victory = true
    current_row = @board.rows[@row_index]
    i = 0
    while i < current_row.size - 2
      victory = current_row[i..i+3].all? {|space| space.player == @player}
        if victory
          return true
        end
         i += 1
    end
    victory
  end

  def vertical_win?
    victory = true
    current_col = []
    #populate the current_col with values of each row at that perticular column
    @board.rows.each do |row|
      current_col << row[@col_index]
    end
    i = 0
    while i < current_col.size - 2
      victory = current_col[i..i+3].all? {|space| space.player == @player}
        if victory
          return true
        end
         i += 1
    end
    victory
  end
end
