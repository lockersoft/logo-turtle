require 'spec_helper'

describe 'Placing the robot on the board' do

  it 'initially places the robot on the board at desired position' do
    position = Position[0,0,'NORTH']

    input = <<END
PLACE #{ position }
REPORT
END

    stdin = StringIO.new input
    app = App.new stdin

    expect { app.start }.to output("#{ position }\n").to_stdout
  end

  it 'places the robot again even if it has already been placed' do
    initial_position = Position[0,0,'NORTH']
    new_position = Position[1,1,'WEST']

    input = <<END
PLACE #{ initial_position }
PLACE #{ new_position }
REPORT
END

    stdin = StringIO.new input
    app = App.new stdin

    expect { app.start }.to output("#{ new_position }\n").to_stdout
  end

  it 'does not report anything if robot has not yet been placed' do
    stdin = StringIO.new
    app = App.new stdin

    expect { app.start }.not_to output.to_stdout
  end

end
