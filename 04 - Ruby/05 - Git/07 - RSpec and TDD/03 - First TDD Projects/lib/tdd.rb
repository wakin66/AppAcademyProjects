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