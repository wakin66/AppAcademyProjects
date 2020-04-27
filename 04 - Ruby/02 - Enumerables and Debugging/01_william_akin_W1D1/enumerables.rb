class Array
    def my_each(&prc)
        idx = 0
        while idx < self.length
            prc.call(self[idx])
            idx += 1
        end
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each {|num| arr << num if prc.call(num)}
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each {|num| arr << num if !prc.call(num)}
        arr
    end

    def my_any?(&prc)
        self.my_each {|num| return true if prc.call(num)}
        false
    end

    def my_all?(&prc)
        count = 0
        self.my_each {|num| count += 1 if prc.call(num)}
        (count == self.length) ? true : false
    end

    def my_flatten
        return [self] if Array.try_convert(self) == nil
        return self if !self.any? {|x| Array.try_convert(x)}
        new_arr = []
        self.each {|x| (Array.try_convert(x) == nil) ? new_arr.push(x) : (x.each {|y| new_arr.push(y)})}
        new_arr.my_flatten
    end

    def my_zip(*arr)
        new_arr = Array.new(self.length) {Array.new}
        self.each_with_index do |x, idx_1|
            new_arr[idx_1] << x
            arr.each do |y|
                y[idx_1] ? (new_arr[idx_1] << y[idx_1]) : (new_arr[idx_1] << nil)
            end
        end
        new_arr
    end

    def my_rotate(num = 1)
        return self if num == 0
        new_arr = []
        self.each {|x| new_arr << x}
        if num > 0
            num.times {new_arr.push(new_arr.shift)}
        else
            num.abs.times {new_arr.unshift(new_arr.pop)}
        end
        new_arr
    end

    def my_join(del = "")
        str = ""
        self.each_with_index do |x,idx|
            str += del if idx != 0
            str += x
        end
        str
    end

    def my_reverse
        new_arr = []
        self.length.times {new_arr.push(self.pop)}
        new_arr
    end
end