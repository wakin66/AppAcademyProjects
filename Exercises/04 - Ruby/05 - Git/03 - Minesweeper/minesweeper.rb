require_relative 'args'

class Game

    def initialize(save = nil)

    end

    def play

    end

end

if __FILE__ == $PROGRAM_NAME
    flags = {           #List of possible cli flags and whether or not they accept another argument
        "-f" => true    #This denotes a save file to be loaded.
    }
    args = Args.new(ARGV,flags)
    if args.include?("-f")
        game = Game.new(args.value("-f"))
    else
        game = Game.new
        game.play
    end
end