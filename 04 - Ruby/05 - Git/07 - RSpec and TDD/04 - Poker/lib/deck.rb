require_relative 'card'

class Deck

    CARD_VALUES = [
        :two,
        :three,
        :four,
        :five,
        :six,
        :seven,
        :eight,
        :nine,
        :ten,
        :eleven,
        :twelve,
        :thirteen,
        :fourteen
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
    end

    def size
        return @cards.length
    end

    def draw_card
        return @cards.shift
    end

    def shuffle
        @cards.shuffle
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