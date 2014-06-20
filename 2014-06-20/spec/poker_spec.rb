require 'rspec'
require_relative '../poker.rb'

describe Poker do

  describe ".compare_hands" do
    subject { Poker.compare_hands(hand1, hand2) }

    context "When receives an invalid number" do
      let(:hand1) { ['0D', '4D', '6D', 'AD', '8C'] }
      let(:hand2) { ['2D', '3D', '6D', 'QD', '8C'] }

      it 'raises an exception for an invalid number' do
        expect{subject}.to raise_error InvalidNumber
      end

    end

    context "When receives an invalid suit" do
      let(:hand1) { ['3X', '4D', '6D', 'AD', '8C'] }
      let(:hand2) { ['2D', '3D', '6D', 'QD', '8C'] }

      it 'raises an exception' do
        expect{subject}.to raise_error InvalidSuit
      end
    end

    context "When receives a nil card" do
      let(:hand1) { ['2D', '4D', '6D', 'AD', '8C'] }
      let(:hand2) { ['2D', '3D', '6D', nil, '8C'] }

      it 'raises an exception' do
        expect{subject}.to raise_error NilCard
      end
    end

    context "when both hands don't have a combination" do

      let(:hand1) { ['2D', '4D', '6D', 'AD', '8C'] }
      let(:hand2) { ['2D', '4D', '6D', 'QD', '8C'] }

      it 'the hand with the highest card wins' do
        expect(subject).to eq(hand1)
      end

      context "when highest cards are the same" do

        let(:hand1) { ['3S', '4S', '6S', 'QS', 'AS'] }
        let(:hand2) { ['2D', '4D', '6D', 'QD', 'AC'] }

        it "compares 'till the last card" do
          expect(subject).to eq(hand1)
        end

      end

    end

  end

end