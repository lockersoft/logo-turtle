require 'spec_helper'

describe 'Moving the robot across the board' do

  it 'stops at the same position if you do a 360 turn left' do
    position = Position[0,0,'NORTH']

    input = <<END
PLACE #{ position }
LEFT
LEFT
LEFT
LEFT
REPORT
END

    stdin = StringIO.new input
    app = App.new stdin

    expect { app.start }.to output("#{ position }\n").to_stdout
  end

  it 'stops at the same position if you do a 2-step round circle' do
    position = Position[0,0,'NORTH']

    input = <<END
PLACE #{ position }
MOVE
MOVE
RIGHT
MOVE
MOVE
RIGHT
MOVE
MOVE
RIGHT
MOVE
MOVE
RIGHT
REPORT
END

    stdin = StringIO.new input
    app = App.new stdin

    expect { app.start }.to output("#{ position }\n").to_stdout
  end

  it 'will not fall off the board if you move too much' do
    position = Position[0,0,'EAST']

    input = "PLACE #{ position }\n"

    (Board::WIDTH + 1).times  do
      input << "MOVE\n"
    end

    input << "REPORT\n"

    stdin = StringIO.new input
    app = App.new stdin

    expected_position = Position[Board::WIDTH - 1, position.y, position.direction]

    expect { app.start }.to output("#{ expected_position }\n").to_stdout
  end

  it 'will not move if it is not previously placed' do
    input = <<END
MOVE
REPORT
END

    stdin = StringIO.new input
    app = App.new stdin

    expect { app.start }.not_to output.to_stdout
  end

end
