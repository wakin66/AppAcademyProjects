def nth_prime(num)
    primes = []
    n = 2
    while primes.length < num
        primes << n if prime?(n)
        n += 1
    end
    primes[-1]
end

def prime?(num)
    (2...num).each {|x| return false if num % x == 0}
    true
end