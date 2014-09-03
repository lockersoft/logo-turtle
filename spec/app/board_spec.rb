require 'spec_helper'

describe Board do

  describe 'HEIGHT/WIDTH class constants' do
    specify 'are integers' do
      expect(Board::HEIGHT).to be_an Integer
      expect(Board::WIDTH).to be_an Integer
    end

    specify 'are greater than zero' do
      expect(Board::HEIGHT).to be > 0
      expect(Board::WIDTH).to be > 0
    end
  end

  describe 'DIRECTIONS class constant' do
    it 'is an Array with all possible directions' do
      expect(Board::DIRECTIONS).to be_an Array
    end
  end

  describe '#place' do
    let(:board) { Board.new }

    it 'returns truthy value if provided position is valid' do
      position = Position[0, 0, 'SOUTH']

      result = board.place(position)

      expect(result).to be_truthy
    end

    it "returns falsey value if provided position exceeds board's width" do
      position = Position[Board::WIDTH + 1, 0, 'SOUTH']

      result = board.place(position)

      expect(result).to be_falsey
    end

    it "returns falsey value if provided position exceeds board's height" do
      position = Position[0, Board::HEIGHT + 1, 'SOUTH']

      result = board.place(position)

      expect(result).to be_falsey
    end

    it "returns falsey value if provided position's direction is invalid" do
      position = Position[0, 0, 'gibberish']

      result = board.place(position)

      expect(result).to be_falsey
    end
  end

end
