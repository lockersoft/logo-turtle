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

  def left
    return unless placed?

    @position = left_turning_position
  end

  def right
    return unless placed?

    @position = right_turning_position
  end

  def placed?
    placed
  end

  def report
    $stdout.puts position.to_s
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

  def left_turning_position
    Position[position.x, position.y, left_turning_direction]
  end

  def right_turning_position
    Position[position.x, position.y, right_turning_direction]
  end

  def left_turning_direction
    directions.left(position.direction)
  end

  def right_turning_direction
    directions.right(position.direction)
  end

  def directions
    Directions.new
  end

end
