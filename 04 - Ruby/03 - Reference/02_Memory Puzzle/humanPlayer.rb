class HumanPlayer

    def prompt
        puts "Please enter the position of the card you'd like to flip (e.g. '2,3')"
        pos = gets.chomp!
        while pos.length != 3
            puts "Please enter a valid position"
            pos = gets.chomp!
        end
        x,y = pos[0].to_i,pos[-1].to_i

        return [x,y]
    end

    def receive_revealed_card(pos,val)
        #Dummy method for 'duck typing' AIPlayer class
    end

    def receive_match
        #Dummy method for 'duck typing' AIPlayer class
    end

end