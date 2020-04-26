class Player
    attr_reader :name

    def initialize(is_ai, num)
        if is_ai
            generate_name
            puts "Player #{num+1}'s name is #{@name}."
        else
            print "Please enter Player #{num+1}'s name: "
            name = gets.chomp
            temp = name.split
            temp.map! {|x| x[0].upcase + x[1..-1]}
            @name = temp.join(" ")
        end
        @is_ai = is_ai
    end

    def is_ai?
        @is_ai
    end

    #generate a name for AI Players
    def generate_name
        names = []
        File.open("names.txt").each {|str| names << str.chomp}
        @name = names[rand(names.length)]
    end

    #get a possible move from a player
    def get_move
        print "#{@name}, what is your letter? "
        move = gets.chomp
        move
    end
end