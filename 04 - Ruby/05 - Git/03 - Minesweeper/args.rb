class Args

    def initialize(arg,list)
        @list = list
        @args = arg_parser(arg)
    end

    def printer
        print @args
        puts ""
    end

    def include?(arg)
        return @args.include?(arg)
    end

    def [](arg)
        return @args[arg]
    end

    def arg_parser(arg)
        args = Hash.new
        temp = arg.select {|x| x.include?("-")}
        # print temp
        # puts
        temp.each do |itm|
            if @list.include?(itm) && @list[itm]
                args[itm] = arg[arg.index(itm)+1]
            elsif @list.include?(itm)
                args[itm] = nil
            else
                puts "Unrecognized argument: #{itm}"
                exit 1
            end
        end
        # print args
        # puts
        return args
    end

end