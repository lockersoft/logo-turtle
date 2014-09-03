require 'spec_helper'

describe Directions do

  let(:directions) { Directions.new }

  describe '#include?' do
    it 'returns true if direction exists' do
      expect(directions).to include 'NORTH'
      expect(directions).to include 'EAST'
      expect(directions).to include 'SOUTH'
      expect(directions).to include 'WEST'
    end

    it 'returns false if direction does not exist' do
      expect(directions).not_to include 'gibberish'
    end
  end

  describe '#left' do
    it 'returns previous direction if we are not at the first element' do
      direction = directions.left 'EAST'

      expect(direction).to eql 'NORTH'
    end

    it 'returns last direction if we were at the first element' do
      direction = directions.left 'NORTH'

      expect(direction).to eql 'WEST'
    end
  end

  describe '#right' do
    it 'returns next direction if we are not at the last element' do
      direction = directions.right 'EAST'

      expect(direction).to eql 'SOUTH'
    end

    it 'returns first direction if we are at the last element' do
      direction = directions.right 'WEST'

      expect(direction).to eql 'NORTH'
    end
  end

end
