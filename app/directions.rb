class Directions

  def include?(direction)
    directions.include?(direction)
  end

  def left(direction)
    directions[directions.index(direction) - 1]
  end

  def right(direction)
    reversed_directions[reversed_directions.index(direction) - 1]
  end

  private

  def directions
    %w(NORTH EAST SOUTH WEST)
  end

  def reversed_directions
    directions.reverse
  end

end
