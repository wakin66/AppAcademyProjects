def evenly_divisable?(num,div)
    (num % div == 0) ? true : false
end

def solution(num)
    test_num = num
    div = 1
    count = 0
    puts "Testing #{test_num}"
    while count < num
        if evenly_divisable?(test_num,div)
            count += 1
            div += 1
        else
            count = 0
            div = 1
            test_num += 1
            puts "Testing #{test_num}"
        end
    end
    test_num
end