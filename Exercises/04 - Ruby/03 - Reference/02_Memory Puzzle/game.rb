require_relative "board"
require_relative "humanPlayer"
require_relative "aiPlayer"

class Game

    def initialize
        @board = Board.new
        @prev_guess = nil
        system("clear")
        puts "Who would you like to play? (H)uman or (C)omputer?"
        choice = gets.chomp!.to_s.upcase!
        while (choice != "C") && (choice != "H")
            puts "Please enter a valid choice:"
            choice = gets.chomp!.to_s.upcase!
        end
        choice == "H" ? (@player = HumanPlayer.new) : (@player = AIPlayer.new)
    end

    def play
        while !@board.won?
            system("clear")
            @board.render
            pos = @player.prompt
            make_guess(pos)
        end
        puts "CONGRATULATIONS! You've won!"
    end

    def make_guess(guessed_pos)
        if @prev_guess.nil?
            @prev_guess = @board.reveal(guessed_pos)
            @player.receive_revealed_card(guessed_pos,@board.reveal(guessed_pos).value)
            system("clear")
            @board.render
            puts "The guessed position is: #{guessed_pos}"
            sleep(5)
        else
            if @board.reveal(guessed_pos) == @prev_guess
                @prev_guess = nil
                system("clear")
                @board.render
                puts "It's a match!"
                @player.receive_revealed_card(guessed_pos,@board.reveal(guessed_pos).value)
                sleep(5)
            else
                system("clear")
                @board.render
                puts "Try again."
                sleep(5)
                @player.receive_revealed_card(guessed_pos,@board.reveal(guessed_pos).value)
                @board.reveal(guessed_pos).hide
                @prev_guess.hide
                @prev_guess = nil
            end
        end
    end

end