require 'spec_helper'

describe 'DIRECTIONS constant' do

  it 'is an Array holding all valid directions' do
    expect(DIRECTIONS).to be_an(Array)
  end

end
