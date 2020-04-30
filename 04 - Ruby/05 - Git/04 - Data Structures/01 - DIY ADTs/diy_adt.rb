class Stack
    def initialize
        # create ivar to store stack here!
        @stack = Array.new
    end

    def push(el)
        # adds an element to the stack
        @stack << el
    end

    def pop
        # removes one element from the stack
        @stack.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @stack.last
    end
end

class Queue
    def initialize
        # create ivar to store queue here!
        @queue = Array.new
    end

    def enqueue(el)
        # adds an element to the queue
        @queue.unshift(el)
    end

    def dequeue
        # removes one element from the queue
        @queue.pop
    end

    def peek
        # returns, but doesn't remove, the next element in the queue
        @queue.last
    end
end

class Map
    def initialize
      # create ivar to store Map here!
      @map = Array.new
    end

    def set(key,val)
        # Creates a new key/val pair or updates an existing one
        if get(key).nil?
            pair = [key,val]
            @map << pair
        else
            @map.each do |pair|
                if pair.first == key
                    pair[-1] = val
                    return val
                end
            end
        end
    end

    def get(key)
        # Returns the value of the supplied key.
        # Returns nil if key doesn't exist in map.
        @map.each do |pair|
            (return pair.last) if pair.first == key
        end
        return nil
    end

    def delete(key)
        # Removes a key from the map
        @map.each.with_index do |pair,idx|
            if pair.first == key
                @map.slice!(idx)
                return true
            end
        end
        return nil
    end

    def show
        # Returns the entire tree
        @map
    end
end