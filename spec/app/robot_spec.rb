require 'spec_helper'

describe Robot do

  let(:board) { instance_double Board }
  let(:robot) { Robot.new board }

  describe '#place' do
    context 'when position coordinates are valid' do
      it 'places the robot on the board at the specified position' do
        position = Position[0, 0, 'SOUTH']

        expect(board).to receive(:valid_position?).with(position).and_return true

        robot.place(position)

        expect(robot).to be_placed
      end
    end
  end

  describe '#move' do
    it 'does not move the robot if it is not placed' do
      expect(robot).not_to be_placed
      expect(robot.move).to be_falsey
    end

    context 'when it is placed' do
      before do
        position = Position[0, 0, 'EAST']

        expect(board).to receive(:valid_position?).and_return true

        robot.place(position)
      end

      it 'moves the robot to a new valid position' do
        expect(board).to receive(:valid_position?).and_return true

        expect { robot.move }.to change { robot.position }
      end

      it 'does not move the robot to an invalid position' do
        expect(board).to receive(:valid_position?).and_return false

        expect { robot.move }.not_to change { robot.position }
      end
    end
  end

  describe '#placed?' do
    it 'is true when robot is placed' do
      expect(robot).to receive(:placed).and_return true

      expect(robot).to be_placed
    end

    it 'is false when robot is not placed' do
      expect(robot).to receive(:placed).and_return false

      expect(robot).not_to be_placed
    end
  end

end
