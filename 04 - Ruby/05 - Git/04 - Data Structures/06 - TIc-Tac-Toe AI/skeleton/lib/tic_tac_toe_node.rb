require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    list = Array.new
    (0..2).each do |x|
      (0..2).each do |y|
        pos = [x,y]
        list << create_node(pos) if @board.empty?(pos)
      end
    end
    return list
  end

  def create_node(pos)
    next_mover_mark == "X" ? mark = "O" : mark = "X"
    next_board = @board.dup
    next_board[pos] = next_mover_mark
    return TicTacToeNode.new(next_board,mark,pos)
  end

end
