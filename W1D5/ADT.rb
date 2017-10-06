class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class My_Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key).nil?
      @map.push([key,value])
    else
      old_pair = get_pair(key)
      old_pair[1] = value
    end
  end

  def remove(key)
    old_pair = get_pair(key)
    @map.delete(old_pair)
  end

  def lookup (key)
    pair = get_pair(key)
    return pair[1] if !pair.nil?
  end

  def get_pair(key)
    @map.select {|pair| pair[0] == key}.first
  end
end
