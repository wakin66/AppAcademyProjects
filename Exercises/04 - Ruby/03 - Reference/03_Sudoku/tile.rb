require "colorize"

class Tile

    def initialize(value,given = false)
        @value = value
        @given = given
    end

    def value #Might change this back to attr_reader when implementing game.rb
        return @value.to_s
    end

    def change_value(value)
        if @given
            @value = value
            return true
        else
            return false
        end
    end

    def to_s
        @given ? (return @value.to_s) : (return @value.to_s.red)
    end

end