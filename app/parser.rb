class Parser

  def initialize(robot, stdin)
    @robot, @stdin = robot, stdin
  end

  def start
    while stdin.gets
      parse_command $_
    end
  end

  private

  attr_reader :robot, :stdin

  def parse_command(cmd)
    command = cmd[parsing_regexp, 1]
    arguments = cmd[parsing_regexp, 2]

    case command
    when 'PLACE'
      robot.place position(parse_coordinates(arguments))
    when 'MOVE'
      robot.move
    when 'LEFT'
      robot.left
    when 'RIGHT'
      robot.right
    when 'REPORT'
      robot.report
    end
  end

  def parsing_regexp
    /([a-z]*)[ ]*(.*)/i
  end

  def parse_coordinates(arguments)
    arguments.split(',').map do |field|
      if field =~ /[\d]+/
        field.to_i
      else
        field
      end
    end
  end

  def position(coordinates)
    Position[*coordinates]
  end

end
