def multiples(num)
    sum = 0
    (1...num).each {|x| sum += x if (x % 3 == 0) || (x % 5 == 0)}
    sum
end