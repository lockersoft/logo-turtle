class Robot

  attr_reader :position

  def initialize(board)
    @board = board
  end

  def place(position)
    if board.valid_position?(position)
      @position = position
      @placed = true
    end
  end

  def move
    return unless placed?
    return unless valid_movement_position?

    @position = movement_position
  end

  def placed?
    placed
  end

  private

  attr_reader :board, :placed

  def valid_movement_position?
    board.valid_position?(movement_position)
  end

  def movement_position
    Position[movement_x_position, movement_y_position, position.direction]
  end

  def movement_x_position
    position.x + movement_delta_x
  end

  def movement_y_position
    position.y + movement_delta_y
  end

  def movement_delta_x
    case position.direction
    when 'EAST'
      1
    when 'WEST'
      -1
    else
      0
    end
  end

  def movement_delta_y
    case position.direction
    when 'NORTH'
      1
    when 'SOUTH'
      -1
    else
      0
    end
  end

end
