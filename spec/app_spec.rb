require 'spec_helper'

describe App do

  describe '#start' do
    it 'initializes board, robot, parser and starts parsing' do
      stdin = double 'STDIN'
      board = instance_double Board
      robot = instance_double Robot
      parser = instance_double Parser

      expect(Board).to receive(:new).and_return(board)
      expect(Robot).to receive(:new).with(board).and_return(robot)
      expect(Parser).to receive(:new).with(robot, stdin).and_return(parser)

      expect(parser).to receive(:start)

      App.new(stdin).start
    end
  end

end
