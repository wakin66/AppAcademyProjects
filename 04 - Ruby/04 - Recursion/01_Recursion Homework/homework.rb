#Exercise 1

def sum_to(num)
    return nil if num < 1
    return 1 if num == 1
    num + sum_to(num-1)
end

#Exercise 2

def add_numbers(arr)
    return nil if arr == []
    return arr.first if arr.length == 1
    arr.first + add_numbers(arr[1..-1])
end

#Exercise 3

def gamma_func(num)
    return nil if num < 1
    return 1 if num == 1
    (num - 1) * gamma_func(num-1)
end

#Exercise 4

def ice_cream_shop(flavors, favorite)
    return false if flavors.length == 0
    return true if flavors.first == favorite
    ice_cream_shop(flavors[1..-1],favorite)
end

#Exercise 5

def reverse(string)
    return string if string.length <= 1
    reverse(string[1..-1]) + string[0]
end