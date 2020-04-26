class AiPlayer
    @@dictionary = Set.new

    def self.load_dictionary
        File.open("dictionary.txt").each {|str| @@dictionary.add(str.chomp)}
    end

    def self.get_move(fragment, num_players)
        self.load_dictionary if @@dictionary.empty?
        winning_moves = Hash.new(0)
        losing_moves = Set.new
        possible_moves = Set.new
        next_move = ""
        #Generate possible, winning, and losing moves
        @@dictionary.each do |word|
            if word.start_with?(fragment)
                losing_moves.add(word[fragment.length]) if word.length == fragment.length + 1
                possible_moves.add(word[fragment.length])
                if word.length - fragment.length <= num_players
                    winning_moves[word[fragment.length]] += 1
                end
            end
        end
        #Determine next move based on possible moves.
        if fragment == "" #if this is the first move chose a random letter
            alpha = "abcdefghijklmnopqrstuvwxyz"
            next_move = alpha[rand(alpha.length)]
        else
            if winning_moves.length > 0
                winning_moves.each do |k,v|
                    #if all winning moves are also immediate losers, then choose a move at random
                    if  winning_moves.all? {|char| losing_moves.include?(char[0])}
                        next_move = possible_moves.to_a[rand(possible_moves.length)][0]
                    else #chose the winning move that has the most words that is not also a losing letter.
                        next_move = k if v > winning_moves[next_move] && !losing_moves.include?(k)
                    end
                end
            else
                #if there are no winning moves, choose a possible move at random.
                while next_move == "" || (!losing_moves.include?(next_move) && losing_moves.length != possible_moves.length && losing_moves.length != 0)
                    next_move = possible_moves.to_a[rand(possible_moves.length)]
                end
            end
        end
        next_move
    end
end