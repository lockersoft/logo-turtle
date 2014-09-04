require_relative 'app/board'
require_relative 'app/directions'
require_relative 'app/parser'
require_relative 'app/position'
require_relative 'app/robot'

class App

  def initialize(stdin = $stdin)
    @stdin = stdin
  end

  def start
    create_board
    create_robot
    create_parser

    start_parsing
  end

  private

  attr_reader :board, :robot, :parser, :stdin

  def create_board
    @board ||= Board.new
  end

  def create_robot
    @robot ||= Robot.new board
  end

  def create_parser
    @parser ||= Parser.new robot, stdin
  end

  def start_parsing
    parser.start
  end

end
