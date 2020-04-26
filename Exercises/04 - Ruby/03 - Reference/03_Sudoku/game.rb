require_relative "board"

class Game

    def initialize
        @board = Board.new(get_board)
    end

    def get_board
        list = {
            1 => "/Users/william/AppAcademy/Exercises/04 - Ruby/03 - Reference/Sudoku/puzzles/sudoku1.txt",
            2 => "/Users/william/AppAcademy/Exercises/04 - Ruby/03 - Reference/Sudoku/puzzles/sudoku2.txt",
            3 => "/Users/william/AppAcademy/Exercises/04 - Ruby/03 - Reference/Sudoku/puzzles/sudoku3.txt",
            4 => "/Users/william/AppAcademy/Exercises/04 - Ruby/03 - Reference/Sudoku/puzzles/sudoku1_almost.txt"
        }
        choice = 0
        while ![1,2,3,4].include?(choice)
            system("clear")
            puts "Which board do you want to play? (1,2,3)  "
            choice = gets.chomp.to_i
        end
        return list[choice]
    end

    def play
        while !@board.solved?
            system("clear")
            @board.render
            pos = Array.new
            val = 0
            while !valid_pos?(pos)
                pos = prompt_pos
            end
            while !valid_value?(val)
                val = prompt_val
            end
            @board.update_value(val,pos)
        end
        system("clear")
        @board.render
        puts "CONGRATS! YOU WON!"
        sleep 5
        return true
    end

    def prompt_pos
        print "What position would you like to change? "
        pos = gets.chomp
        return pos.split(',').map! {|x| x.to_i}
    end

    def prompt_val
        print "What value would you like to change it to? "
        value = gets.chomp.to_i
        return value
    end

    def valid_value?(val)
        return [1,2,3,4,5,6,7,8,9].include?(val)
    end

    def valid_pos?(pos)
        nums = [0,1,2,3,4,5,6,7,8]
        x,y = pos[0],pos[1]
        (nums.include?(x) && nums.include?(y) && (pos.length == 2)) ? (return true) : (return false)
    end
end

if __FILE__ == $PROGRAM_NAME
    game = Game.new
    game.play
end