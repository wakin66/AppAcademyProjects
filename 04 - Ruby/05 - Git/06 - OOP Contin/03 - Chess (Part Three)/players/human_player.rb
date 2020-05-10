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
                    print "Where do you want to move the #{board[start_pos].class}?"
                    until end_pos
                        start_pos = display.cursor.get_input
                        system('clear')
                        display.render
                    end
                else
                    system('clear')
                    display.render
                    print "What piece do you want to move?"
                    until start_pos
                        start_pos = display.cursor.get_input
                        system('clear')
                        display.render
                    end
                end
            end
            board.move_piece(color,start_pos,end_pos)
        rescue NoPieceError => e
            puts e.message
            start_pos = nil
            retry
        rescue EndPositionError => e
            puts e.message
            end_pos = nil
            retry
        end
    end

end