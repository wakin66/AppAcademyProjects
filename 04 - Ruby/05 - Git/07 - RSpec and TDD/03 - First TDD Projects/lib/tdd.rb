def my_uniq(arr)
    raise ArgumentError unless arr.is_a?(Array)
    new_arr = Array.new
    arr.each {|itm| new_arr << itm if !new_arr.include?(itm)}
    return new_arr
end