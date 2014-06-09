require 'rspec'
require 'pry'
require_relative '../spiral_factory'

describe SpiralFactory do
  subject { SpiralFactory }

  describe '.draw' do
    # it 'draws a matrix 1x1' do
    #   expect( subject.draw(1, 1) ).to eq "1"
    # end

    it 'draws a matrix 1x2' do
      expect( subject.draw(1, 2) ).to eq "1 2"
    end

    it 'draws a matrix 2x1' do
      expect( subject.draw(2, 1) ).to eq "1\n2"
    end

    it 'draws a matrix 10x1' do
      expect( subject.draw(10, 1) ).to eq "1\n2\n3\n4\n5\n6\n7\n8\n9\n10"
    end    

    it 'draws a matrix 1x10' do
      expect( subject.draw(1, 10) ).to eq "1 2 3 4 5 6 7 8 9 10"
    end    

    it 'draws a matrix 2x2' do
      expect( subject.draw(1, 2) ).to eq "1 2\n4 3"
    end

  end
end