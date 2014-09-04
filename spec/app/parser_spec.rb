require 'spec_helper'

describe Parser do

  let(:robot) { instance_double Robot }

  describe '#start' do
    it 'parses PLACE command' do
      position = Position[0,0,'NORTH']
      input = "PLACE #{ position }"
      stdin = StringIO.new input
      parser = Parser.new robot, stdin

      expect(robot).to receive(:place).with position

      parser.start
    end

    %w(MOVE LEFT RIGHT REPORT).each do |input|
      it "parses #{ input } command" do
        stdin = StringIO.new input
        parser = Parser.new robot, stdin

        expect(robot).to receive(input.downcase)

        parser.start
      end
    end
  end

end
