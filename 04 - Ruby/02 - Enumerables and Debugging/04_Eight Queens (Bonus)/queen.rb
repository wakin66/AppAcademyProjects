class Queen
    attr_reader :position, :threats

    def initialize(position,size)
        @position = position
        @size = size
        @threats = Array.new
        generate_threats()
        
    end

    def is_threat?(loc)
        if loc[0] == @position[0] || loc[1] == @position[1]
            return true
        elsif generate_diagnal(@position).include?(loc)
            return true
        else
           return false 
        end
    end

    def generate_threats
        @threats.clear
        (0...@size).each do |x|
            (0...@size).each do |y|
                @threats << [x,y] if is_threat?([x,y])
            end
        end
    end

    def generate_diagnal(loc)
        diagnals = Array.new
        #Up & Left
        newPosition = Array.new
        oldPosition = Array.new
        oldPosition[0] = loc[0]
        oldPosition[1] = loc[1]
        loop do
            newPosition[0] = oldPosition[0] - 1
            newPosition[1] = oldPosition[1] - 1
            if newPosition[0] < 0 || newPosition[0] >= @size
                break
            elsif newPosition[1] < 0 || newPosition[1] >= @size
                break
            end
            diagnals.push(newPosition)
            oldPosition = newPosition
            newPosition = Array.new
        end
        oldPosition = Array.new
        #Up & Right
        oldPosition[0] = loc[0]
        oldPosition[1] = loc[1]
        loop do
            newPosition[0] = oldPosition[0] - 1
            newPosition[1] = oldPosition[1] + 1
            if newPosition[0] < 0 || newPosition[0] >= @size
                break
            elsif newPosition[1] < 0 || newPosition[1] >= @size
                break
            end
            diagnals.push(newPosition)
            oldPosition = newPosition
            newPosition = Array.new
        end
        oldPosition = Array.new
        #Down & Left
        oldPosition[0] = loc[0]
        oldPosition[1] = loc[1]
        loop do
            newPosition[0] = oldPosition[0] + 1
            newPosition[1] = oldPosition[1] - 1
            if newPosition[0] < 0 || newPosition[0] >= @size
                break
            elsif newPosition[1] < 0 || newPosition[1] >= @size
                break
            end
            diagnals.push(newPosition)
            oldPosition = newPosition
            newPosition = Array.new
        end
        oldPosition = Array.new
        #Down & Right
        oldPosition[0] = loc[0]
        oldPosition[1] = loc[1]
        loop do
            newPosition[0] = oldPosition[0] + 1
            newPosition[1] = oldPosition[1] + 1
            if newPosition[0] < 0 || newPosition[0] >= @size
                break
            elsif newPosition[1] < 0 || newPosition[1] >= @size
                break
            end
            diagnals.push(newPosition)
            oldPosition = newPosition
            newPosition = Array.new
        end
        return diagnals
    end

    def is_edge?(loc)
        if (loc[0] == 0) || (loc[1] == 0)
            return true
        elsif (loc[0] == @size - 1) || (loc[1] == @size - 1)
            return true
        else
            return false
        end
    end

    def print_threats
        board = Array.new(@size) {Array.new(@size)}
        @threats.each do |threat|
            board[threat[0]][threat[1]] = "X"
        end
        board[@position[0]][@position[1]] = "Q"
        print " "
        @size.times {|x| print " " + x.to_s}
        puts ""
        board.each_with_index do |line, idx|
            print " "
            (@size*2+1).times {print "-"}
            puts ""
            print idx
            line.each do |x|
                if x == nil
                    print "| "
                elsif x == "Q"
                    print "|Q"
                else
                    print "|X"
                end
            end
            puts "|"
        end
        print " "
        (@size*2+1).times {print "-"}
        puts ""
    end

end