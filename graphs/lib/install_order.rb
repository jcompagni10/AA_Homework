# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to


require_relative "graph"
require_relative "topological_sort"

# def install_order(arr)
#   graph = {}
#   arr.each do |package|
#     vertex = graph[package[0]] || Vertex.new(package[0])
#     dependency = graph[package[1]] || Vertex.new(package[1])
#     Edge.new(dependency, vertex)
#     graph[vertex.value] = vertex
#     graph[dependency.value] = dependency
#   end
#   vertices = graph.values
#   sorted = topological_sort(vertices)
#   sorted = sorted.map(&:value)
#   add_missing(sorted, graph)
#   # vertices = {}
#   # arr.each do |package|
#   #   package = Vertex.new(package[0])
#   #   vertices[package.value] = package
# end

def add_missing(arr, graph)
  max = arr.max
  new_vals = []
  (0..max).each do |val|
    new_vals << val unless graph[val]
  end
  new_vals + arr
end

def install_order2(arr)
  graph = {}
  arr.each do |package|
    vertex = graph[package[0]] || Vertex.new(package[0])
    if package[1]
      dependency = graph[package[1]] || Vertex.new(package[1]) 
      Edge.new(dependency, vertex)
      graph[dependency.value] = dependency
    end
    graph[vertex.value] = vertex
  end
  topological_sort(graph.values)
end

arr = [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2], [4, 3], [9, 1], [1, nil], [5, nil]]

p install_order2(arr).map(&:value)