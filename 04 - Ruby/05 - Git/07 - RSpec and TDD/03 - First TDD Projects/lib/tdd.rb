def my_uniq(arr)
    raise ArgumentError unless arr.is_a?(Array)
    new_arr = Array.new
    arr.each {|itm| new_arr << itm if !new_arr.include?(itm)}
    return new_arr
end

class Array
    def two_sum
        pairs = Array.new
        self.each.with_index do |itm,first_idx|
            second_idx = first_idx+1
            while second_idx < self.length
                pairs << [first_idx,second_idx] if itm+self[second_idx] == 0
                second_idx += 1
            end
        end
        return pairs
    end
end

def my_transpose(arr)
    raise ArgumentError unless arr.is_a?(Array) && arr.first.is_a?(Array)
    new_arr = Array.new
    (0..arr.length-1).each do |itm|
        new_line = Array.new
        arr.each {|col| new_line << col[itm]}
        new_arr << new_line
    end
    return new_arr
end

def stock_picker(prices)
    raise ArgumentError unless prices.is_a?(Array)
    profits = Hash.new
    prices.each.with_index do |price,first_day|
        last_day = first_day + 1
        while last_day < prices.length
            profits[[first_day,last_day]] = prices[last_day]-prices[first_day]
            last_day += 1
        end
    end
    highest_profits = profits.key(profits.values.max)
    return highest_profits
end

class Hanoi
    attr_reader :pegs

    def initialize
        @pegs = Array.new(3) {Array.new(4)}
        fill_pegs
    end

    def fill_pegs
        (1..4).each.with_index {|size,idx| @pegs.first[idx] = size}
    end

    def valid_pos?(pos)
        [0,1,2].include? pos
    end

    def valid_move?(start_pos,end_pos)
        return false if pegs[start_pos].all? {|ring| ring.empty?}
        return true if pegs[end_pos].all? {|ring| ring.empty?}
        
        return false
    end

    def get_top_ring(peg)
        
    end

    def make_move(start_pos,end_pos)

    end

    def game_over?
        return true if pegs[1].none? {|peg| peg.nil?}
        return true if pegs[2].none? {|peg| peg.nil?}
        return false
    end

    def render
        peg_list = {
            nil => "   |   ",
            1 => "   *   ",
            2 => "  ***  ",
            3 => " ***** ",
            4 => "*******"
        }
        puts "#{peg_list[pegs[0][0]]} #{peg_list[pegs[1][0]]} #{peg_list[pegs[2][0]]}"
        puts "#{peg_list[pegs[0][1]]} #{peg_list[pegs[1][1]]} #{peg_list[pegs[2][1]]}"
        puts "#{peg_list[pegs[0][2]]} #{peg_list[pegs[1][2]]} #{peg_list[pegs[2][2]]}"
        puts "#{peg_list[pegs[0][3]]} #{peg_list[pegs[1][3]]} #{peg_list[pegs[2][3]]}"
        puts "   1       2       3   "
    end

    def get_move

    end

    def play

    end
end