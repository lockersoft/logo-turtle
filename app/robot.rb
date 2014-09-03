class Robot

  def initialize(board)
    @board = board
  end

  def place(position)
    if board.place(position)
      @position = position
      @placed = true
    end
  end

  def placed?
    placed
  end

  private

  attr_reader :board, :position, :placed

end
