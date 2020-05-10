require_relative 'player.rb'

class HumanPlayer < Player

    def initialize(color,display)
        super
    end

    def make_move(board)
        start_pos = nil
        end_pos = nil

        begin
            until start_pos && end_pos
                if start_pos
                    system('clear')
                    display.render
                    puts "Where do you want to move the #{board[start_pos].class}?"
                    until end_pos
                        end_pos = display.cursor.get_input
                        system('clear')
                        display.render
                        puts "Where do you want to move the #{board[start_pos].class}?"
                    end
                else
                    system('clear')
                    display.render
                    puts "What piece do you want to move?"
                    until start_pos
                        start_pos = display.cursor.get_input
                        system('clear')
                        display.render
                        puts "What piece do you want to move?"
                        start_pos = nil if start_pos != nil && board[start_pos].empty?
                    end
                    display.cursor.switch_selected
                end
            end
            board.move_piece(color,start_pos,end_pos)
        rescue NoPieceError => e
            puts e.message
            start_pos = nil
            retry
        rescue EndPositionError => e
            puts e.message
            if start_pos == end_pos
                start_pos = nil
                display.cursor.switch_selected
            end

            end_pos = nil
            retry
        end
        display.cursor.switch_selected
    end

end