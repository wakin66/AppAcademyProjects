class Card
    attr_reader :value, :suit

    def initialize(value,suit)
        raise(ArgumentError,"Invalid card value") unless value.is_a?(Symbol)
        raise(ArgumentError,"Invalid card suit") unless suit.is_a?(Symbol)
        @value = value
        @suit = suit
    end

    def to_s
        return "#{value} of #{suit}"
    end
end