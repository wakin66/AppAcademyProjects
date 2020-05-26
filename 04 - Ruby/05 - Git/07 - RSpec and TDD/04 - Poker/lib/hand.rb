require_relative 'deck'

class Hand
    attr_reader :cards, :hand

    def initialize(deck)
        @cards = Array.new
        @deck = deck
        fill_hand
        @hand = generate_hand
    end

    def exchange_cards(arr)

    end

    def compare_hands(hand1,hand2)

    end

    private
    attr_reader :deck

    def fill_hand
        5.times {cards << deck.draw_card}
    end

    def generate_hand
        return :royal_flush if royal_flush?
        return :straight_flush if straight_flush?
        return :four_of_kind if four_of_kind?
        return :full_house if full_house?
        return :flush if flush?
        return :straight if straight?
        return :three_of_kind if three_of_kind?
        return :two_pair if two_pair?
        return :one_pair if one_pair?
        return high_card
    end

    def royal_flush?

    end

    def straight_flush?

    end

    def four_of_kind?

    end

    def full_house?

    end

    def flush?
        return true if cards.all? {|card| card.suit == :Spades}
        return true if cards.all? {|card| card.suit == :Clubs}
        return true if cards.all? {|card| card.suit == :Diamonds}
        return true if cards.all? {|card| card.suit == :Hearts}
        return false
    end

    def straight?

    end

    def three_of_kind?

    end

    def two_pair?
        values = Hash.new(0)
        cards.each {|card| values[card.value] += 1}
        return true if values.count {|k,v| v == 2} == 2
    end

    def one_pair?
        values = Hash.new(0)
        cards.each {|card| values[card.value] += 1}
        return true if values.one? {|k,v| v == 2}
    end

    def high_card
        values = Array.new
        cards.each {|card| values << card.value}
        return :Ace if values.include?(:Ace)
        return :King if values.include?(:King)
        return :Queen if values.include?(:Queen)
        return :Jack if values.include?(:Jack)
        return :Ten if values.include?(:Ten)
        return :Nine if values.include?(:Nine)
        return :Eight if values.include?(:Eight)
        return :Seven if values.include?(:Seven)
        return :Six if values.include?(:Six)
        return :Five if values.include?(:Five)
        return :Four if values.include?(:Four)
        return :Three if values.include?(:Three)
        return :Two if values.include?(:Two)
    end
end