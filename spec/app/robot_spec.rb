require 'spec_helper'

describe Robot do

  let(:board) { instance_double Board }

  describe '#place' do
    context 'when position coordinates are valid' do
      it 'places the robot on the board at specified position' do
        position = Position[0, 0, 'SOUTH']
        robot = Robot.new board

        expect(board).to receive(:place).with(position).and_return true

        robot.place(position)

        expect(robot).to be_placed
      end
    end
  end

  describe '#placed?' do
    it 'is true when robot is placed' do
      robot = Robot.new board

      expect(robot).to receive(:placed).and_return true

      expect(robot).to be_placed
    end

    it 'is false when robot is not placed' do
      robot = Robot.new board

      expect(robot).to receive(:placed).and_return false

      expect(robot).not_to be_placed
    end
  end

end
