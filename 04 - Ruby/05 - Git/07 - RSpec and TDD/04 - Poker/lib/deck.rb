require_relative 'card'

class Deck

    CARD_VALUES = [
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

    CARD_SUITS = [
        :Spades,
        :Clubs,
        :Diamonds,
        :Hearts
    ]

    def initialize
        @cards = Array.new
        fill_cards
        shuffle
    end

    def size
        return @cards.length
    end

    def draw_card
        return @cards.shift
    end

    def shuffle
        @cards.shuffle!
    end

    private

    def fill_cards
        CARD_SUITS.each do |suit|
            CARD_VALUES.each do |value|
                @cards << Card.new(value,suit)
            end
        end
    end

end