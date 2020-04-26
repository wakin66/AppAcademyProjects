class AIPlayer

    def initialize
        @known_cards = Hash.new
        @matched_cards = Hash.new
        @positions = Array.new
        (0...4).each do |x|
            (0...4).each {|y| @positions << [x,y]}
        end
    end

    def prompt
        if @matched_cards.empty?
            return @positions.slice!(rand(@positions.length))
        else
            puts "Matched Cards is currently: #{@matched_cards}"
            sleep(5)
            return @matched_cards.shift[-1]
        end
    end

    def receive_revealed_card(pos,val)
        receive_match(pos,@known_cards.key(val)) if (!@known_cards.key(val).nil? && @known_cards[pos].nil?)
        @known_cards[pos] = val
    end

    def receive_match(pos1,pos2)
        @matched_cards[pos1] = pos2
    end
end