def even_fibonacci_numbers(num)
    fib = [1]
    next_fib = 1
    while next_fib < num
        fib << next_fib
        next_fib = (fib[-1]+fib[-2])
    end
    fib.inject(0) {|acc,num| num.even? ? (acc + num) : acc}
end