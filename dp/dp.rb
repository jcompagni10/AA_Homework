class DynamicProgramming

  #BLAIR
  def initialize
    @cache = { 1 => 1, 2 => 2 }
    @frog_cache = { 0 => [[]]}
    @s_frog_cache = {}
  end

  def blair_nums_td(n)
    return @cache[n] if @cache[n]
    val = blair_nums_td(n - 1) + blair_nums_td(n - 2) + nth_odd(n - 1)
    @cache[n] = val
    val
    # Base case(s): which inputs n should return early?
    # Recursive case: what's the recursive relationship?
    # *NB*: you'll need to figure out how to express the nth odd number in terms of n.
  end

  def blair_nums_helper(n)
    cache = { 1 => 1, 2 => 2 }
    return cache if n < 3
    (3..n).each do |idx|
      cache[idx] = cache[idx - 1] + cache[idx - 2] + nth_odd(idx - 1)
    end
    cache
  end

  def blair_nums_bu(n)
    cache = blair_nums_helper(n)
    cache[n]
  end

  def nth_odd(n)
    (n - 1) * 2 + 1
  end


  #FROG STUFF

  def frog_cache_builder(n, max_hop)
    cache = { 0 => [[]]}
    return cache if n <= 0
    (1..n).each do |idx|
      all_sets = []
      (1..max_hop).each do |jump_size|
        prev_set = cache[idx - jump_size]
        all_sets += prev_set.map { |subset| subset + [jump_size] } if idx - jump_size >= 0
      end
      cache[idx] = all_sets
    end
    cache
  end
  # def frog_cache_builder(n)
  #   cache = { 0 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
  #   return cache if n < 4
  #   (4..n).each do |idx|
  #     all_sets = []
  #     (1..3).each do |jump_size|
  #       prev_set = cache[idx - jump_size]
  #       all_sets += prev_set.map { |subset| subset + [jump_size] }
  #     end
  #     cache[idx] = all_sets
  #   end
  #   cache
  # end

  def frog_hop_bu(n)
    cache = frog_cache_builder(n, 3)
    cache[n]    
  end


  def frog_hop_td(n)
    return @frog_cache[n] if @frog_cache[n]
    all_sets = []
    (1..3).each do |jump_size|
      prev_set = frog_hop_td(n - jump_size)
      all_sets += prev_set.map { |subset| subset + [jump_size] }
    end
    all_sets
  end

  def frog_hop_td(n)
    return @frog_cache[n] if @frog_cache[n]
    all_sets = []
    (1..3).each do |jump_size|
      set_idx = n - jump_size
      if set_idx >= 0
        prev_set = frog_hop_td(set_idx)
        all_sets += prev_set.map { |subset| subset + [jump_size] }
      end
    end
    all_sets
  end

  def super_frog_hops(num_stairs, max_stairs)
    cache = frog_cache_builder(num_stairs, max_stairs)
    cache[num_stairs]    
  end


end 




dp = DynamicProgramming.new

# p dp.frog_hop_bu(20).length == dp.frog_hop_bu(20).uniq.length
p dp.super_frog_hops(3,3)