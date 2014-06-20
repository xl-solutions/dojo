class Poker

  def self.compare_hands(hand1, hand2)
    validate_hand!(hand1)
    validate_hand!(hand2)

    @max_1 = highest_card_index(hand1)
    @max_2 = highest_card_index(hand2)

    if @max_1 == @max_2
      @max_1 = highest_card_index(hand1)
      @max_2 = highest_card_index(hand2)
    else
      @max_1 > @max_2 ? hand1 : hand2
    end
  end

  def self.highest_card_index(hand)
    max = 0
    hand.each do |card|
      validate_number!(card)
      validate_suit!(card)

      index = Poker.card_values.index(card[0])
      max = index unless max >= index
    end
    max
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

class InvalidNumber < StandardError; end
class InvalidSuit < StandardError; end
class NilCard < StandardError; end