def factors(num)
  new_arr = []
  test = 2.0
  while new_arr == [] && test < num
    new_arr << test if num % test == 0 && prime?(num/test)
    puts "Testing #{test}"
    test += 1 if new_arr = []
  end
  new_arr == [] ? "There were no prime factors." : num/test
end

def prime?(num)
    (2...num).each {|x| return false if num % x == 0}
    true
end
