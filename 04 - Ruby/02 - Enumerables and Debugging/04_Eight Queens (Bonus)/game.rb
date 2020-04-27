require_relative "board"
require_relative "queen"

class Game
attr_reader :board, :size

    def initialize(size=nil)
        if size.nil?
            print "What size game would you like to play? "
            @size = gets.chomp.to_i
            while @size == 2 || @size == 3 || @size <= 0
                puts "There is no solution for the starting value #{@size}."
                print "Please choose a new starting size: "
                @size = gets.chomp.to_i
            end
        else
            @size = size
        end
        @board = Board.new(@size.to_i)
        puts "The " + @size.to_s + "x" + @size.to_s + " board has been set up."
        @board.print_board
        @list_of_queens = Array.new
        @placement_attempts = 0 #This tracks how many times the game has attempted to place a queen during a given itteration.
        @location_attempted = Array.new
        @pos1 = Array.new
        @pos2 = Array.new
        (0...@size.to_i).each {|x| @pos1 << x}
        (0...@size.to_i).each {|x| @pos2 << x}
        place_queen
    end

    def random_location
        position = Array.new(2)
        position[0] = @pos1.slice!(rand(@pos1.length))
        position[1] = @pos2.slice!(rand(@pos2.length))
        return position
    end

    def place_queen
        position = Array.new
        position = random_location
        print "New Position: "
        puts position[0].to_s + "x" + position[1].to_s
        queen = Queen.new(position,@board.size)
        if @board.empty?(position)
            @list_of_queens.each do |q|
                if q.threats.include?(position)
                    @placement_attempts += 1
                    @pos1 << position[0]
                    @pos2 << position[1]
                    if @placement_attempts < 50
                        place_queen
                    end
                    return false
                end
            end
            @board.set_piece(position,queen)
            @list_of_queens << queen
            print "The queen has been placed at: "
            puts position[0].to_s + "x" + position[1].to_s
            @placement_attempts = 0
            @board.print_board
            return true
        else
            @placement_attempts += 1
            @pos1 << position[0]
            @pos2 << position[1]
            if @placement_attempts < 50
                place_queen        #Need to remove possablility for infinite loop
            end
            return false
        end
    end

    def num_queens
        num = @list_of_queens.length
        return num
    end

    def available_list
        threatened = Array.new
        available = 0
        @list_of_queens.each do |x|
            threatened << x.threats
            threatened << x.position
        end
        threatened.flatten!(1).uniq!
        (0...@board.size).each do |x|
            (0...@board.size).each do |y|
                available += 1 if !threatened.include?([x,y])
            end
        end
        return available
    end

    def solve
        number = 0
        size = 0
        counter = 0
        game = Game.new
        loop do
            counter += 1
            game = Game.new(size) if size != 0
            while game.available_list > 0
                game.place_queen
            end
            if game.num_queens == game.size
                puts "Congratulations!  You placed all #{game.size} queens after #{counter} attempts."
                break
            else
                puts "Unfortunately there are no more moves that can be made.  Please try again."
            end
        end
        size = game.size
    end

end

if __FILE__ == $PROGRAM_NAME
    number = 0
    size = 0
    counter = 0
    game = Game.new
    loop do
        counter += 1
        puts "Game number #{counter} started."
        game = Game.new(size) if size != 0
        while game.available_list > 0
            game.place_queen
        end
        if game.num_queens == game.size
            puts "Congratulations!  You placed all #{game.size} queens after #{counter} attempts."
            break
        else
            puts "Unfortunately there are no more moves that can be made.  Please try again."
        end
        size = game.size
    end
end