class Board

  WIDTH = 5
  HEIGHT = 5

  def valid_position?(position)
    position.x >= 0 && position.x < WIDTH &&
      position.y >= 0 && position.y < HEIGHT &&
      directions.include?(position.direction)
  end

  private

  def directions
    Directions.new
  end

end
