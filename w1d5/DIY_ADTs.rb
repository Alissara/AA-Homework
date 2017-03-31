#Exercise 1 - Stack

class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

# Exercise 2 - Queue

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

end

# Exercise 3 - Map

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    index = @map.index { |subarr| subarr[0] == key }

    if index
      @map[index][1] = value
    else
      @map << [key, value]
    end

    [key, value]
  end

  def lookup(key)
    @map.each do |subarr|
      return subarr[1] if subarr[0] == key
    end
    nil
  end

  def remove(key)
    @map.reject! do |subarr|
      subarr[0] == key
    end
    nil
  end

  def show
    @map.dup
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

end

m = Map.new
m.assign(0, "dog")
m.assign(1, "cat")
m.assign(2, "turtle")
m.assign(3, "bear")
p m.show == [[0, "dog"], [1, "cat"], [2, "turtle"], [3, "bear"]]
m.assign(3, "panda")
p m.show == [[0, "dog"], [1, "cat"], [2, "turtle"], [3, "panda"]]
p m.lookup(3) == "panda"
m.remove(2)
p m.show == [[0, "dog"], [1, "cat"], [3, "panda"]]
