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
        arr.each do |idx|
            cards[idx] = deck.draw_card
        end
    end

    def compare_hands(hand1,hand2)

    end

    private
    attr_writer :cards
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
        straight_flush? && (high_card == :Ace) ? (return true) : (return false)
    end

    def straight_flush?
        straight? && flush? ? (return true) : (return false)
    end

    def four_of_kind?
        values = Hash.new(0)
        cards.each {|card| values[card.value] += 1}
        values.one? {|k,v| v == 4} ? (return true) : (return false)
    end

    def full_house?
        values = Hash.new(0)
        cards.each {|card| values[card.value] += 1}
        (values.one? {|k,v| v == 2}) && (values.one? {|k,v| v == 3}) ? (return true) : (return false)
    end

    def flush?
        return true if cards.all? {|card| card.suit == :Spades}
        return true if cards.all? {|card| card.suit == :Clubs}
        return true if cards.all? {|card| card.suit == :Diamonds}
        return true if cards.all? {|card| card.suit == :Hearts}
        return false
    end

    def straight?
        card_values = [
            :Two,
            :Three,
            :Four,
            :Five,
            :Six,
            :Seven,
            :Eight,
            :Nine,
            :Ten,
            :Jack,
            :Queen,
            :King,
            :Ace
        ]
        values = Array.new
        cards.each {|card| values << card.value}
        idx = low_card(values)
        return idx if !idx
        count = 1
        4.times do
            idx += 1
            return false if !values.include?(card_values[idx])
        end
        return true
    end

    def low_card(values)
        return 0 if values.include?(:Two)
        return 1 if values.include?(:Three)
        return 2 if values.include?(:Four)
        return 3 if values.include?(:Five)
        return 4 if values.include?(:Six)
        return 5 if values.include?(:Seven)
        return 6 if values.include?(:Eight)
        return 7 if values.include?(:Nine)
        return 8 if values.include?(:Ten)
        return false
    end

    def three_of_kind?
        values = Hash.new(0)
        cards.each {|card| values[card.value] += 1}
        values.any? {|k,v| v == 3} ? (return true) : (return false)
    end

    def two_pair?
        values = Hash.new(0)
        cards.each {|card| values[card.value] += 1}
        values.count {|k,v| v == 2} == 2 ? (return true) : (return false)
    end

    def one_pair?
        values = Hash.new(0)
        cards.each {|card| values[card.value] += 1}
        values.one? {|k,v| v == 2} ? (return true) : (return false)
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