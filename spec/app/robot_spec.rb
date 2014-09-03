require 'spec_helper'

describe Robot do

  let(:board) { instance_double Board }
  let(:robot) { Robot.new board }
  let(:position) { Position[0, 0, 'SOUTH'] }

  it 'ignores any commands if it is not placed' do
    expect(robot).not_to be_placed

    expect(robot.move).to be_falsey
    expect(robot.left).to be_falsey
    expect(robot.right).to be_falsey
  end

  describe '#place' do
    context 'when position coordinates are valid' do
      it 'places the robot on the board at the specified position' do
        expect(board).to receive(:valid_position?).with(position).and_return true

        robot.place(position)

        expect(robot).to be_placed
      end
    end

    context 'when position coordinates are invalid' do
      it 'does not place the robot on the board' do
        expect(board).to receive(:valid_position?).with(position).and_return false

        robot.place(position)

        expect(robot).not_to be_placed
      end
    end
  end

  context 'movement and turning methods' do
    before do
      expect(board).to receive(:valid_position?).and_return true

      robot.place(position)
    end

    describe '#move' do
      it 'moves the robot to a new valid position' do
        expect(board).to receive(:valid_position?).and_return true

        expect { robot.move }.to change { robot.position }
      end

      it 'does not move the robot to an invalid position' do
        expect(board).to receive(:valid_position?).and_return false

        expect { robot.move }.not_to change { robot.position }
      end
    end

    describe '#left' do
      it 'turns robot left' do
        directions = instance_double Directions

        expect(robot).to receive(:directions).and_return directions
        expect(directions).to receive(:left).and_return 'EAST'

        expect { robot.left }.to change { robot.position.direction }
      end
    end

    describe '#right' do
      it 'turns robot right' do
        directions = instance_double Directions

        expect(robot).to receive(:directions).and_return directions
        expect(directions).to receive(:right).and_return 'WEST'

        expect { robot.right }.to change { robot.position.direction }
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

  describe '#report' do
    it "prints robot's position to STDOUT" do
      position = double 'Position'
      output = 'output'

      expect(robot).to receive(:position).and_return position
      expect(position).to receive(:to_s).and_return output

      expect { robot.report }.to output("#{ output }\n").to_stdout
    end
  end

end
