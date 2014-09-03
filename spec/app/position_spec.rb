require 'spec_helper'

describe Position do

  let(:x) { 1 }
  let(:y) { 2 }
  let(:direction) { 'NORTH' }
  let(:position) { Position[x, y, direction] }

  it 'is a Struct with x, y, direction attributes' do
    expect(position).to be_a Struct
    expect(position.x).to eql x
    expect(position.y).to eql y
    expect(position.direction).to eql direction
  end

  describe '#to_s' do
    it 'outputs a strings of all elements joined by commas' do
      result = position.to_s

      expect(result).to be_a String
      expect(result).to match ','
      expect(result).to match x.to_s
      expect(result).to match y.to_s
      expect(result).to match direction
    end
  end

end
