#Problem 1: 

def sum_recur(array)
    return array.first if array.length == 1
    sum = array.first + sum_recur(array[1..-1])
    return sum
end

#Problem 2: 

def includes?(array, target)
    return false if array.nil?
    return true if array.first == target
    includes?(array[1..-1],target)
end

# Problem 3: 

def num_occur(array, target)
    return 0 if array.nil?
    count = 0
    count += 1 if array.first == target
    count + num_occur(array[1..-1],target)
end

# Problem 4: 

def add_to_twelve?(array)
    return false if array.length <= 1
    return true if array.first + array[1] == 12
    add_to_twelve?(array[1..-1])
end

# Problem 5: 

def sorted?(array)
    return true if array.length <= 1
    return false if array.first > array[1]
    sorted?(array[1..-1])
end

# Problem 6: 

def reverse(string)
    return string if string.length <= 1
    reverse(string[1..-1])+string[0]
end
