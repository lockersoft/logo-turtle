require 'spec_helper'

describe Position do

  it 'is a Struct with x, y, direction attributes' do
    x = 1
    y = 2
    direction = 'NORTH'

    position = Position[x, y, direction]

    expect(position).to be_a Struct
    expect(position.x).to eql x
    expect(position.y).to eql y
    expect(position.direction).to eql direction
  end

end
