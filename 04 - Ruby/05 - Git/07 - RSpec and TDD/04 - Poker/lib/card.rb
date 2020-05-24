class Card
    attr_reader :value, :suit

    VALUES = {
        :eleven => :Jack,
        :twelve => :Queen,
        :thirteen => :King,
        :fourteen => :Ace
    }

    def initialize(value,suit)
        raise(ArgumentError,"Invalid card value") unless value.is_a?(Symbol)
        raise(ArgumentError,"Invalid card suit") unless suit.is_a?(Symbol)
        @value = value
        @suit = suit
        values_default
    end

    def to_s
        return "#{VALUES[value]} of #{suit}"
    end

    private

    def values_default
        VALUES.default_proc = proc do |hash, key|
            hash[key] = key
        end
    end
end