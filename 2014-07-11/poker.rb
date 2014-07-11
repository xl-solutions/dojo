require 'ostruct'

class Poker

  def self.compare_hands(hand1, hand2)
    validate_hand!(hand1)
    validate_hand!(hand2)

    os_hand1 = OpenStruct.new(original_hand: hand1, hand: hand1.dup)
    os_hand2 = OpenStruct.new(original_hand: hand2, hand: hand2.dup)

    HighestCard.compare_highest_card(os_hand1, os_hand2)
  end

  def self.play_value
    ['one_pair', 'two_pairs']
  end

  def self.card_values
    ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
  end

  def self.suit_values
    ['C', 'D', 'H', 'S']
  end

  def self.validate_number! card
    raise InvalidNumber unless card_values.include?(card[0])
  end

  def self.validate_suit! card
    raise InvalidSuit unless suit_values.include?(card[1])
  end

  def self.validate_nil_card! card
    raise NilCard if card.nil?
  end

  def self.validate_hand!(hand)
    hand.each do |card|
      validate_nil_card!(card)
      validate_number!(card)
      validate_suit!(card)
    end
  end

end

class HighestCard

  def self.compare_highest_card(hand1, hand2)
    return nil if hand1.hand.size == 0
    result_hand_1 = highest_card_index(hand1.hand)
    result_hand_2 = highest_card_index(hand2.hand)

    if result_hand_1[:card_index] == result_hand_2[:card_index]
      hand1.hand.delete_at(result_hand_1[:hand_index])
      hand2.hand.delete_at(result_hand_2[:hand_index])

      compare_highest_card(hand1, hand2)
    else
      result_hand_1[:card_index] > result_hand_2[:card_index] ? hand1.original_hand : hand2.original_hand
    end
  end

  def self.highest_card_index(hand)
    max = {}
    hand.each_with_index do |card, i|

      index  = Poker.card_values.index(card[0])

      if max[:card_index].nil? || !(max[:card_index] >= index)
        max[:card_index] = index
        max[:hand_index] = i
      end
    end

    max
  end

end

class InvalidNumber < StandardError; end
class InvalidSuit < StandardError; end
class NilCard < StandardError; end