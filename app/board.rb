class Board

  WIDTH = 5
  HEIGHT = 5

  def valid_position?(position)
    position.x >= 0 && position.x < WIDTH &&
      position.y >= 0 && position.y < HEIGHT &&
      DIRECTIONS.include?(position.direction)
  end

end
