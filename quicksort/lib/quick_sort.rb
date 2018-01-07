class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.pop
    left = []
    right = []
    until array.empty? 
      el = array.pop
      if (el <=> pivot) == -1
        left << el
      else
        right << el
      end
    end
    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    # prc ||= Proc.new {|a,b| a<=>b}
    
    return array if length <= 1 
    pivot = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, pivot-start, &prc)
    QuickSort.sort2!(array, pivot + 1, length - pivot - 1, &prc )
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|a,b| a<=>b}
    pivot = start
    pivot_val = array[pivot]
    split = start
    (start + 1 ...split + length).each do |idx|
      if prc.call(pivot_val, array[idx]) == 1
        unless start + 1 == idx
          array[split + 1], array[idx] = array[idx], array[split + 1]
        end
        split += 1
      end
    end
    array[pivot], array[split] = array[split ], array[pivot]
    p split
    split
  end
end
