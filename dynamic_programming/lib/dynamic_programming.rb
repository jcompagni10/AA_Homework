class DynamicProgramming

  def initialize
    @cache = { 1 => 1, 2 => 2 }
    @frog_cache = { 0 => [[]] }
  end

  def blair_nums(n)
    return @cache[n] if @cache[n]
    val = blair_nums(n - 1) + blair_nums(n - 2) + nth_odd(n - 1)
    @cache[n] = val
    val
  end

  def nth_odd(n)
    (n - 1) * 2 + 1
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n, 3)
    cache[n]    
  end

  def frog_cache_builder(n, max_hop)
    cache = { 0 => [[]] }
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

  def frog_hops_top_down(n)
    @frog_cache = { 0 => [[]] }
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    all_sets = []
    (1..3).each do |jump_size|
      set_idx = n - jump_size
      if set_idx >= 0
        prev_set = frog_hops_top_down_helper(set_idx)
        all_sets += prev_set.map { |subset| subset + [jump_size] }
      end
    end
    all_sets
  end

  def super_frog_hops(n, k)
    cache = frog_cache_builder(n, k)
    cache[n]    
  end

  def knapsack(weights, values, capacity)

  end

  # # Helper method for bottom-up implementation
  # def knapsack_table(weights, values, capacity)
  #   table = [[0,0,0]]
  #   (1..capacity) do |cur_capacity|
  #     table[cur_capacity] = []
  #     for values.each_with_index do |value, item|
  #       smaller = (cur_capacity > 1)? table[cur_capacity][item-1] : 0
  #       if weights[item] <= cur_capacity 

  #       else
  #         table[cur_capacity][item] = smaller
  #       end     
  #   end
  # end

  def maze_solver(maze, start_pos, end_pos); end
end
