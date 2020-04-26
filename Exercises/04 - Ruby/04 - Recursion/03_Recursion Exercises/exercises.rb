#Warmup

def range(start_num,end_num)
    return [] if end_num <= start_num
    [start_num]+range(start_num+1,end_num)
end

def itterative_range(start_num,end_num)
    range = []
    i = start_num
    while i < end_num
        range << i
        i += 1
    end
    return range
end

#Exponentiation

def exp1(base,exp)
    return nil if exp < 0
    return 1 if exp == 0
    base * exp1(base, exp-1)
end

def exp2(base,exp)
    return 1 if exp == 0
    return base if exp == 1
    if exp.even?
        return exp2(base,exp/2) * exp2(base,exp/2)
    else
        return base * (exp2(base,((exp-1)/2))*exp2(base,((exp-1)/2)))
    end
end

#Deep Dup

class Array

    def deep_dup
        return self.dup if self.length == 1
        arr = Array.new
        self.each do |ele|
            if ele.is_a?(Array)
                arr << ele.deep_dup
            else
                arr << ele
            end
        end
        return arr
    end

end

#Fibonacci

def fib(int)
    return [1] if int == 1
    return [1,1] if int == 2
    return fib(int-1) + [(fib(int-1)[-1] + fib(int-2)[-1])]
end

def itterative_fib(int)
    return [1] if int == 1
    return [1,1] if int == 2
    arr = [1,1]
    (int-2).times {arr << arr[-2]+arr[-1]}
    return arr
end

#Binary Search

def bsearch(arr,target)
    #print arr
    #puts ""
    arr.length.even? ? idx = arr.length/2 : idx = (arr.length-1)/2
    return nil if arr.empty? || (arr.length == 1 && arr[idx] != target)
    return idx if arr[idx] == target
    if target < arr[idx]
        sub_arr = arr[0...idx]
        if bsearch(sub_arr,target).nil?
            return nil
        elsif bsearch(sub_arr,target) == 0
            return idx - bsearch(sub_arr,target) - 1
        else
            return idx - bsearch(sub_arr,target)
        end
    else
        sub_arr = arr[idx+1..-1]
        if bsearch(sub_arr,target).nil?
            return nil
        else
            return idx + bsearch(sub_arr,target) + 1
        end
    end
end

#Merge Sort     NOT DONE

class Array
    def merge_sort
        return self if self.length == 0 || self.length == 1

    end

    def merge(arr1,arr2)
        arr = Array.new
        arr1.each do |item1|
            arr2.each do |item2|
                if item1 <= item2
                    
                end
            end
        end
    end
end

#Array Subsets

class Array
    def subsets
        return [] if self.empty?
        return [[],self.first] if self.length == 1
        new_arr = Array.new
        self[0..-2].subsets.each do |ele|
            if ele == []
                new_arr << ele
            else
                new_arr << [ele].flatten
            end
        end
        self[0..-2].subsets.each do |ele|
            if ele == []
                new_arr << [self[-1]]
            else
                new_arr << ([ele]+[self[-1]]).flatten
            end
        end
        return new_arr
    end
end

#Permutations       NOT DONE

def permutations(array)
    return array if array.length <= 1
    arr = Array.new
    arr << array
    permutations(array[0..-2]).each do |ele|
        arr << ([array[-1]]+[ele]).flatten
    end

    return arr
end

#Make Change        NOT DONE

def greedy_make_change(cents,coins = [25,10,5,1])
    return [cents] if coins.include?(cents)
    arr = Array.new
    coins.each do |coin|
        if coin < cents
            arr << coin
            break
        end
    end
    greedy_make_change(cents-arr.first,coins).each {|coin| arr << coin}
    return arr
end

def make_better_change(cents,coins = [25,10,5,1])
    return [cents] if coins.include?(cents)

end