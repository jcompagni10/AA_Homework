class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    else
      @cache << el
    end
    @cache.shift if count > count
  end

  def show
    @cache.dup
  end

  private
  # helper methods go here!

end

c = LRUCache.new(4)
p c.add(1)
p c.add(2)
p c.add(1)
p c.add(4)
p c.add(5)
p c.add(1)
p c.show
p c.count
