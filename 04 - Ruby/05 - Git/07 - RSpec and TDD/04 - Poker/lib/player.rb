require_relative 'hand'

class Player

    def initialize(deck,starting_pot)
        @hand = Hand.new(deck)
        @pot = starting_pot
    end

    def get_discards
        puts "Which cards would you like to discard?"
        print ">> "
        idx = gets.chomp.split(",")
        hand.exchange_cards(idx)
    end

    def get_move
        puts "What would you like to do?"
        puts "(F)old"
        puts "(S)ee"
        puts "(R)aise"
        move = nil
        until move && "fsr".include?(move)
            print ">> "
            move = gets.chomp.downcase
            case move
                when "f"
                    return :Fold
                when "s"
                    return :See
                when "r"
                    return :Raise
            end
        end
    end

    private
    attr_reader :hand

end