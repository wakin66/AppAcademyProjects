class Card
    attr_reader :face_up, :value

    def initialize(value)
        @value = value
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s
        @value.to_s
    end

    def ==(other)
        self.to_s == other.to_s ? (return true) : (return false)
    end
end